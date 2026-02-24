package com.dojo.frontend.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.client.RestTemplate;

import java.util.*;

@Controller
public class DashboardController {

    private final RestTemplate restTemplate;
    private final String gatewayUrl;

    private static final String[] BELT_ORDER = {"BLANCO", "AMARILLO", "NARANJA", "VERDE", "MARRON", "NEGRO"};

    public DashboardController(RestTemplate restTemplate,
                               @Value("${gateway.url}") String gatewayUrl) {
        this.restTemplate = restTemplate;
        this.gatewayUrl = gatewayUrl;
    }

    @GetMapping("/dashboard")
    public String dashboard(HttpSession session, Model model) {
        String token = (String) session.getAttribute("token");
        if (token == null) {
            return "redirect:/login";
        }

        String username = (String) session.getAttribute("username");
        model.addAttribute("username", username);

        String[][] belts = {
                {"BLANCO", "White Belt", "bg-light text-dark"},
                {"AMARILLO", "Yellow Belt", "bg-warning text-dark"},
                {"NARANJA", "Orange Belt", "bg-orange"},
                {"VERDE", "Green Belt", "bg-success"},
                {"MARRON", "Brown Belt", "bg-brown"},
                {"NEGRO", "Black Belt", "bg-dark"}
        };
        model.addAttribute("belts", belts);

        HttpHeaders headers = new HttpHeaders();
        headers.set("Authorization", "Bearer " + token);
        HttpEntity<Void> entity = new HttpEntity<>(headers);

        // Fetch flashcards for each belt
        for (String[] belt : belts) {
            try {
                ResponseEntity<List<Map<String, Object>>> response = restTemplate.exchange(
                        gatewayUrl + "/api/content/flashcards?difficulty=" + belt[0],
                        HttpMethod.GET, entity,
                        new ParameterizedTypeReference<>() {});

                List<Map<String, Object>> flashcards = response.getBody();
                model.addAttribute("flashcards_" + belt[0], flashcards != null ? flashcards : Collections.emptyList());
            } catch (Exception e) {
                model.addAttribute("flashcards_" + belt[0], Collections.emptyList());
            }
        }

        // Fetch user progress from progress-service
        int totalCorrect = 0;
        int totalAttempted = 0;
        int currentStreak = 0;
        int bestStreak = 0;
        Map<String, Map<String, Object>> beltProgressMap = new HashMap<>();

        try {
            ResponseEntity<Map<String, Object>> progressResponse = restTemplate.exchange(
                    gatewayUrl + "/api/progress/" + username,
                    HttpMethod.GET, entity,
                    new ParameterizedTypeReference<>() {});

            Map<String, Object> progressData = progressResponse.getBody();
            if (progressData != null) {
                @SuppressWarnings("unchecked")
                Map<String, Object> userProgress = (Map<String, Object>) progressData.get("userProgress");
                if (userProgress != null) {
                    totalCorrect = ((Number) userProgress.getOrDefault("totalCorrect", 0)).intValue();
                    totalAttempted = ((Number) userProgress.getOrDefault("totalAttempted", 0)).intValue();
                    currentStreak = ((Number) userProgress.getOrDefault("currentStreak", 0)).intValue();
                    bestStreak = ((Number) userProgress.getOrDefault("bestStreak", 0)).intValue();
                }

                @SuppressWarnings("unchecked")
                List<Map<String, Object>> beltList = (List<Map<String, Object>>) progressData.get("beltProgress");
                if (beltList != null) {
                    for (Map<String, Object> bp : beltList) {
                        String beltLevel = (String) bp.get("beltLevel");
                        beltProgressMap.put(beltLevel, bp);
                    }
                }
            }
        } catch (Exception ignored) {
            // Progress service may not be available yet
        }

        model.addAttribute("totalCorrect", totalCorrect);
        model.addAttribute("totalAttempted", totalAttempted);
        model.addAttribute("currentStreak", currentStreak);
        model.addAttribute("bestStreak", bestStreak);

        // Compute belt unlock status and progress percentages
        // BLANCO is always unlocked. Each subsequent belt requires previous to be mastered.
        Map<String, Boolean> unlockedMap = new LinkedHashMap<>();
        Map<String, Boolean> masteredMap = new LinkedHashMap<>();
        Map<String, Integer> percentageMap = new LinkedHashMap<>();

        boolean previousMastered = true; // BLANCO starts unlocked
        for (String beltCode : BELT_ORDER) {
            boolean unlocked = previousMastered;
            unlockedMap.put(beltCode, unlocked);

            Map<String, Object> bp = beltProgressMap.get(beltCode);
            boolean mastered = false;
            int percentage = 0;

            if (bp != null) {
                int correctCount = ((Number) bp.getOrDefault("correctCount", 0)).intValue();
                int attemptCount = ((Number) bp.getOrDefault("attemptCount", 0)).intValue();
                mastered = bp.get("mastered") != null && (Boolean) bp.get("mastered");
                percentage = attemptCount > 0 ? (correctCount * 100) / attemptCount : 0;
            }

            masteredMap.put(beltCode, mastered);
            percentageMap.put(beltCode, percentage);

            previousMastered = mastered;
        }

        model.addAttribute("unlockedMap", unlockedMap);
        model.addAttribute("masteredMap", masteredMap);
        model.addAttribute("percentageMap", percentageMap);

        return "dashboard";
    }
}
