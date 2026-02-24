package com.dojo.frontend.controller;

import com.dojo.frontend.dto.AuthResponse;
import com.dojo.frontend.dto.LoginRequest;
import com.dojo.frontend.dto.RegisterRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestTemplate;

@Controller
public class AuthController {

    private final RestTemplate restTemplate;
    private final String gatewayUrl;

    public AuthController(RestTemplate restTemplate,
                          @Value("${gateway.url}") String gatewayUrl) {
        this.restTemplate = restTemplate;
        this.gatewayUrl = gatewayUrl;
    }

    @GetMapping("/login")
    public String loginPage(Model model) {
        model.addAttribute("loginRequest", new LoginRequest());
        return "login";
    }

    @PostMapping("/login")
    public String login(@ModelAttribute LoginRequest loginRequest,
                        HttpSession session, Model model) {
        try {
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);
            HttpEntity<LoginRequest> entity = new HttpEntity<>(loginRequest, headers);

            ResponseEntity<AuthResponse> response = restTemplate.postForEntity(
                    gatewayUrl + "/api/auth/login", entity, AuthResponse.class);

            AuthResponse authResponse = response.getBody();
            if (authResponse != null) {
                session.setAttribute("token", authResponse.getToken());
                session.setAttribute("username", authResponse.getUsername());
                session.setAttribute("role", authResponse.getRole());
            }
            return "redirect:/dashboard";
        } catch (HttpClientErrorException e) {
            model.addAttribute("error", "Invalid username or password");
            model.addAttribute("loginRequest", loginRequest);
            return "login";
        } catch (Exception e) {
            model.addAttribute("error", "Service unavailable. Please try again later.");
            model.addAttribute("loginRequest", loginRequest);
            return "login";
        }
    }

    @GetMapping("/register")
    public String registerPage(Model model) {
        model.addAttribute("registerRequest", new RegisterRequest());
        return "register";
    }

    @PostMapping("/register")
    public String register(@ModelAttribute RegisterRequest registerRequest,
                           HttpSession session, Model model) {
        try {
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);
            HttpEntity<RegisterRequest> entity = new HttpEntity<>(registerRequest, headers);

            ResponseEntity<AuthResponse> response = restTemplate.postForEntity(
                    gatewayUrl + "/api/auth/register", entity, AuthResponse.class);

            AuthResponse authResponse = response.getBody();
            if (authResponse != null) {
                session.setAttribute("token", authResponse.getToken());
                session.setAttribute("username", authResponse.getUsername());
                session.setAttribute("role", authResponse.getRole());
            }
            return "redirect:/dashboard";
        } catch (HttpClientErrorException e) {
            model.addAttribute("error", "Registration failed. Username or email may already exist.");
            model.addAttribute("registerRequest", registerRequest);
            return "register";
        } catch (Exception e) {
            model.addAttribute("error", "Service unavailable. Please try again later.");
            model.addAttribute("registerRequest", registerRequest);
            return "register";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }

    @GetMapping("/")
    public String home() {
        return "redirect:/login";
    }
}
