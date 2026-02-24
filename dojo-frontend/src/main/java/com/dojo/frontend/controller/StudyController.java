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

        model.addAttribute("username", session.getAttribute("username"));
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

            ResponseEntity<List<Map<String, Object>>> response = restTemplate.exchange(
                    gatewayUrl + "/api/content/flashcards?difficulty=" + difficulty,
                    HttpMethod.GET, entity,
                    new ParameterizedTypeReference<>() {});

            List<Map<String, Object>> flashcards = response.getBody();
            model.addAttribute("flashcards", flashcards != null ? flashcards : Collections.emptyList());
        } catch (Exception e) {
            model.addAttribute("flashcards", Collections.emptyList());
            model.addAttribute("error", "Could not load flashcards. Please try again.");
        }

        return "study";
    }
}
