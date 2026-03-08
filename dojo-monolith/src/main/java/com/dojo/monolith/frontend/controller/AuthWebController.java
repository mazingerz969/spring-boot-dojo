package com.dojo.monolith.frontend.controller;

import com.dojo.monolith.auth.dto.AuthResponse;
import com.dojo.monolith.auth.dto.LoginRequest;
import com.dojo.monolith.auth.dto.RegisterRequest;
import com.dojo.monolith.auth.service.AuthService;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AuthWebController {

    private final AuthService authService;

    public AuthWebController(AuthService authService) {
        this.authService = authService;
    }

    @GetMapping("/")
    public String root() {
        return "redirect:/login";
    }

    @GetMapping("/login")
    public String loginPage(Model model) {
        model.addAttribute("loginRequest", new LoginRequest());
        return "login";
    }

    @PostMapping("/login")
    public String login(@RequestParam String username, @RequestParam String password,
                        HttpSession session, Model model) {
        try {
            LoginRequest req = new LoginRequest();
            req.setUsername(username);
            req.setPassword(password);
            AuthResponse response = authService.login(req);
            session.setAttribute("token", response.getToken());
            session.setAttribute("username", response.getUsername());
            session.setAttribute("role", response.getRole());
            return "redirect:/dashboard";
        } catch (Exception e) {
            model.addAttribute("error", "Credenciales inválidas");
            model.addAttribute("loginRequest", new LoginRequest());
            return "login";
        }
    }

    @GetMapping("/register")
    public String registerPage(Model model) {
        model.addAttribute("registerRequest", new RegisterRequest());
        return "register";
    }

    @PostMapping("/register")
    public String register(@RequestParam String username, @RequestParam String email,
                           @RequestParam String password, HttpSession session, Model model) {
        try {
            RegisterRequest req = new RegisterRequest();
            req.setUsername(username);
            req.setEmail(email);
            req.setPassword(password);
            AuthResponse response = authService.register(req);
            session.setAttribute("token", response.getToken());
            session.setAttribute("username", response.getUsername());
            session.setAttribute("role", response.getRole());
            return "redirect:/dashboard";
        } catch (Exception e) {
            model.addAttribute("error", e.getMessage());
            model.addAttribute("registerRequest", new RegisterRequest());
            return "register";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }
}
