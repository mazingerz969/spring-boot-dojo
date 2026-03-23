package com.dojo.frontend.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.client.RestTemplate;

import java.util.*;

@Controller
public class RankingController {

    private final RestTemplate restTemplate;
    private final String gatewayUrl;

    public RankingController(RestTemplate restTemplate,
                             @Value("${gateway.url}") String gatewayUrl) {
        this.restTemplate = restTemplate;
        this.gatewayUrl = gatewayUrl;
    }

    @GetMapping("/ranking")
    public String ranking(HttpSession session, Model model) {
        String token = (String) session.getAttribute("token");
        if (token == null) {
            return "redirect:/login";
        }

        String username = (String) session.getAttribute("username");
        model.addAttribute("username", username);

        HttpHeaders headers = new HttpHeaders();
        headers.set("Authorization", "Bearer " + token);
        HttpEntity<Void> entity = new HttpEntity<>(headers);

        try {
            ResponseEntity<Map<String, Object>> globalResp = restTemplate.exchange(
                    gatewayUrl + "/api/progress/ranking/global?username=" + username,
                    HttpMethod.GET, entity,
                    new ParameterizedTypeReference<>() {});
            model.addAttribute("globalRanking", globalResp.getBody());
        } catch (Exception e) {
            model.addAttribute("globalRanking", null);
        }

        try {
            ResponseEntity<Map<String, Object>> streakResp = restTemplate.exchange(
                    gatewayUrl + "/api/progress/ranking/streak?username=" + username,
                    HttpMethod.GET, entity,
                    new ParameterizedTypeReference<>() {});
            model.addAttribute("streakRanking", streakResp.getBody());
        } catch (Exception e) {
            model.addAttribute("streakRanking", null);
        }

        try {
            ResponseEntity<Map<String, Object>> beltsResp = restTemplate.exchange(
                    gatewayUrl + "/api/progress/ranking/belts?username=" + username,
                    HttpMethod.GET, entity,
                    new ParameterizedTypeReference<>() {});
            model.addAttribute("beltsRanking", beltsResp.getBody());
        } catch (Exception e) {
            model.addAttribute("beltsRanking", null);
        }

        return "ranking";
    }
}
