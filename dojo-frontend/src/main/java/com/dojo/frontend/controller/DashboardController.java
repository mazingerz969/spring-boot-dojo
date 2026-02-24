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

import java.util.Collections;
import java.util.List;
import java.util.Map;

@Controller
public class DashboardController {

    private final RestTemplate restTemplate;
    private final String gatewayUrl;

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

        model.addAttribute("username", session.getAttribute("username"));

        String[][] belts = {
                {"BLANCO", "White Belt", "bg-light text-dark"},
                {"AMARILLO", "Yellow Belt", "bg-warning text-dark"},
                {"NARANJA", "Orange Belt", "bg-orange"},
                {"VERDE", "Green Belt", "bg-success"},
                {"MARRON", "Brown Belt", "bg-brown"},
                {"NEGRO", "Black Belt", "bg-dark"}
        };
        model.addAttribute("belts", belts);

        for (String[] belt : belts) {
            try {
                HttpHeaders headers = new HttpHeaders();
                headers.set("Authorization", "Bearer " + token);
                HttpEntity<Void> entity = new HttpEntity<>(headers);

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

        return "dashboard";
    }
}
