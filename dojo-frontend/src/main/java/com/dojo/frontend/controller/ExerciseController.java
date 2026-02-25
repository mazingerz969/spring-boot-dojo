package com.dojo.frontend.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import java.util.*;

@Controller
public class ExerciseController {

    private final RestTemplate restTemplate;
    private final String gatewayUrl;

    public ExerciseController(RestTemplate restTemplate,
                              @Value("${gateway.url}") String gatewayUrl) {
        this.restTemplate = restTemplate;
        this.gatewayUrl = gatewayUrl;
    }

    @GetMapping("/exercises")
    public String exercises(HttpSession session, Model model) {
        String token = (String) session.getAttribute("token");
        if (token == null) return "redirect:/login";

        model.addAttribute("username", session.getAttribute("username"));

        try {
            HttpHeaders headers = new HttpHeaders();
            headers.set("Authorization", "Bearer " + token);
            HttpEntity<Void> entity = new HttpEntity<>(headers);

            ResponseEntity<List<Map<String, Object>>> response = restTemplate.exchange(
                    gatewayUrl + "/api/exercises",
                    HttpMethod.GET, entity,
                    new ParameterizedTypeReference<>() {});

            List<Map<String, Object>> exercises = response.getBody();
            if (exercises == null) exercises = Collections.emptyList();

            // Agrupar por cinturón
            Map<String, List<Map<String, Object>>> byBelt = new LinkedHashMap<>();
            String[] belts = {"BLANCO", "AMARILLO", "NARANJA", "VERDE", "MARRON", "NEGRO"};
            for (String belt : belts) byBelt.put(belt, new ArrayList<>());
            for (Map<String, Object> ex : exercises) {
                String belt = (String) ex.get("belt");
                byBelt.computeIfAbsent(belt, k -> new ArrayList<>()).add(ex);
            }
            // Quitar cinturones vacíos
            byBelt.entrySet().removeIf(e -> e.getValue().isEmpty());

            model.addAttribute("exercisesByBelt", byBelt);
        } catch (Exception e) {
            model.addAttribute("exercisesByBelt", Collections.emptyMap());
            model.addAttribute("error", "Could not load exercises. Make sure content-service is running.");
        }

        return "exercises";
    }

    @GetMapping("/exercises/{id}")
    public String exerciseDetail(@PathVariable Long id, HttpSession session, Model model) {
        String token = (String) session.getAttribute("token");
        if (token == null) return "redirect:/login";

        model.addAttribute("username", session.getAttribute("username"));

        try {
            HttpHeaders headers = new HttpHeaders();
            headers.set("Authorization", "Bearer " + token);
            HttpEntity<Void> entity = new HttpEntity<>(headers);

            ResponseEntity<Map<String, Object>> response = restTemplate.exchange(
                    gatewayUrl + "/api/exercises/" + id,
                    HttpMethod.GET, entity,
                    new ParameterizedTypeReference<>() {});

            model.addAttribute("exercise", response.getBody());
        } catch (Exception e) {
            model.addAttribute("error", "Exercise not found.");
        }

        return "exercise-detail";
    }

    @PostMapping("/exercises/{id}/validate")
    public String validateCode(@PathVariable Long id,
                               @RequestParam String code,
                               HttpSession session, Model model) {
        String token = (String) session.getAttribute("token");
        if (token == null) return "redirect:/login";

        model.addAttribute("username", session.getAttribute("username"));

        try {
            HttpHeaders headers = new HttpHeaders();
            headers.set("Authorization", "Bearer " + token);
            headers.setContentType(MediaType.APPLICATION_JSON);
            HttpEntity<Map<String, String>> entity = new HttpEntity<>(Map.of("code", code), headers);

            ResponseEntity<Map<String, Object>> validateResponse = restTemplate.exchange(
                    gatewayUrl + "/api/exercises/" + id + "/validate",
                    HttpMethod.POST, entity,
                    new ParameterizedTypeReference<>() {});

            model.addAttribute("result", validateResponse.getBody());
            model.addAttribute("userCode", code);

            // Re-fetch exercise
            HttpEntity<Void> getEntity = new HttpEntity<>(headers);
            ResponseEntity<Map<String, Object>> exResponse = restTemplate.exchange(
                    gatewayUrl + "/api/exercises/" + id,
                    HttpMethod.GET, getEntity,
                    new ParameterizedTypeReference<>() {});
            model.addAttribute("exercise", exResponse.getBody());

        } catch (Exception e) {
            model.addAttribute("error", "Error validating code: " + e.getMessage());
        }

        return "exercise-detail";
    }
}
