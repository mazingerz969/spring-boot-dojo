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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import java.util.Collections;
import java.util.List;
import java.util.Map;

@Controller
public class StudyController {

    private final RestTemplate restTemplate;
    private final String gatewayUrl;

    public StudyController(RestTemplate restTemplate,
                           @Value("${gateway.url}") String gatewayUrl) {
        this.restTemplate = restTemplate;
        this.gatewayUrl = gatewayUrl;
    }

    @GetMapping("/study")
    public String study(@RequestParam String difficulty, HttpSession session, Model model) {
        String token = (String) session.getAttribute("token");
        if (token == null) {
            return "redirect:/login";
        }

        String username = (String) session.getAttribute("username");
        model.addAttribute("username", username);
        model.addAttribute("difficulty", difficulty);

        String[] beltNames = {"BLANCO", "AMARILLO", "NARANJA", "VERDE", "MARRON", "NEGRO"};
        String[] beltLabels = {"White Belt", "Yellow Belt", "Orange Belt", "Green Belt", "Brown Belt", "Black Belt"};
        for (int i = 0; i < beltNames.length; i++) {
            if (beltNames[i].equals(difficulty)) {
                model.addAttribute("beltLabel", beltLabels[i]);
                break;
            }
        }

        try {
            HttpHeaders headers = new HttpHeaders();
            headers.set("Authorization", "Bearer " + token);
            HttpEntity<Void> entity = new HttpEntity<>(headers);

            // Use spaced repetition endpoint - prioritizes cards user got wrong
            ResponseEntity<List<Map<String, Object>>> response = restTemplate.exchange(
                    gatewayUrl + "/api/content/flashcards/next?difficulty=" + difficulty + "&userId=" + username,
                    HttpMethod.GET, entity,
                    new ParameterizedTypeReference<>() {});

            List<Map<String, Object>> flashcards = response.getBody();
            model.addAttribute("flashcards", flashcards != null ? flashcards : Collections.emptyList());
        } catch (Exception e) {
            // Fallback to normal endpoint if spaced repetition fails
            try {
                HttpHeaders headers = new HttpHeaders();
                headers.set("Authorization", "Bearer " + token);
                HttpEntity<Void> entity = new HttpEntity<>(headers);

                ResponseEntity<List<Map<String, Object>>> response = restTemplate.exchange(
                        gatewayUrl + "/api/content/flashcards?difficulty=" + difficulty,
                        HttpMethod.GET, entity,
                        new ParameterizedTypeReference<>() {});

                List<Map<String, Object>> flashcards = response.getBody();
                model.addAttribute("flashcards", flashcards != null ? flashcards : Collections.emptyList());
            } catch (Exception e2) {
                model.addAttribute("flashcards", Collections.emptyList());
                model.addAttribute("error", "Could not load flashcards. Please try again.");
            }
        }

        return "study";
    }

    @PostMapping("/study/answer")
    public String recordAnswer(@RequestParam Long flashcardId,
                               @RequestParam String difficulty,
                               @RequestParam boolean correct,
                               HttpSession session) {
        String token = (String) session.getAttribute("token");
        String username = (String) session.getAttribute("username");
        if (token == null) {
            return "redirect:/login";
        }

        try {
            HttpHeaders headers = new HttpHeaders();
            headers.set("Authorization", "Bearer " + token);
            HttpEntity<Void> entity = new HttpEntity<>(headers);

            // Record flashcard answer for spaced repetition
            restTemplate.exchange(
                    gatewayUrl + "/api/content/flashcards/" + flashcardId + "/answer?userId=" + username + "&correct=" + correct,
                    HttpMethod.POST, entity,
                    new ParameterizedTypeReference<Map<String, Object>>() {});

            // Also record in progress service
            HttpHeaders postHeaders = new HttpHeaders();
            postHeaders.set("Authorization", "Bearer " + token);
            postHeaders.set("Content-Type", "application/json");
            HttpEntity<Map<String, Object>> progressEntity = new HttpEntity<>(
                    Map.of("username", username, "beltLevel", difficulty, "correct", correct),
                    postHeaders);
            restTemplate.postForEntity(gatewayUrl + "/api/progress/record", progressEntity, Object.class);
        } catch (Exception ignored) {
            // Best effort
        }

        return "redirect:/study?difficulty=" + difficulty;
    }
}
