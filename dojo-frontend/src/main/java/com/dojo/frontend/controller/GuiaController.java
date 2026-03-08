package com.dojo.frontend.controller;

import com.dojo.frontend.controller.guia.*;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.*;

@Controller
public class GuiaController {

    private static final List<Map<String, Object>> PASOS = new ArrayList<>();

    static {
        // Cada capítulo está en su propia clase para mantenibilidad.
        // Ver: com.dojo.frontend.controller.guia.GuiaCapituloXX
        PASOS.add(GuiaCapitulo01.getPaso());  // Preparación del Entorno
        PASOS.add(GuiaCapitulo02.getPaso());  // Estructura del Proyecto
        PASOS.add(GuiaCapitulo03.getPaso());  // Eureka Server
        PASOS.add(GuiaCapitulo04.getPaso());  // Auth Service (JWT)
        PASOS.add(GuiaCapitulo05.getPaso());  // Content Service (API REST)
        PASOS.add(GuiaCapitulo06.getPaso());  // API Gateway
        PASOS.add(GuiaCapitulo07.getPaso());  // Frontend Base (Thymeleaf)
        PASOS.add(GuiaCapitulo08.getPaso());  // Dashboard + Estudio
        PASOS.add(GuiaCapitulo09.getPaso());  // Sistema de Quizzes
        PASOS.add(GuiaCapitulo10.getPaso());  // Progress Service
        PASOS.add(GuiaCapitulo11.getPaso());  // Repetición Espaciada
        PASOS.add(GuiaCapitulo12.getPaso());  // Sistema de Cinturones
        PASOS.add(GuiaCapitulo13.getPaso());  // Ejercicios de Código
        PASOS.add(GuiaCapitulo14.getPaso());  // Guía Integrada
        PASOS.add(GuiaCapitulo15.getPaso());  // Docker Compose
        PASOS.add(GuiaCapitulo16.getPaso());  // Arranque y Arquitectura
    }

    @GetMapping("/guia")
    public String guia(HttpSession session, Model model,
                       @RequestParam(required = false, defaultValue = "0") int paso) {
        String token = (String) session.getAttribute("token");
        if (token == null) {
            return "redirect:/login";
        }

        model.addAttribute("pasos", PASOS);
        model.addAttribute("pasoActual", paso);
        model.addAttribute("totalPasos", PASOS.size());

        if (paso >= 0 && paso < PASOS.size()) {
            model.addAttribute("detalle", PASOS.get(paso));
        }

        return "guia";
    }
}
