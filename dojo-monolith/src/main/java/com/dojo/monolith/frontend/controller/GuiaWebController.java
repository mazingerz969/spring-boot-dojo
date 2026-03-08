package com.dojo.monolith.frontend.controller;

import com.dojo.monolith.frontend.controller.guia.*;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.*;

@Controller
public class GuiaWebController {

    private static final List<Map<String, Object>> PASOS = new ArrayList<>();

    static {
        PASOS.add(GuiaCapitulo01.getPaso());
        PASOS.add(GuiaCapitulo02.getPaso());
        PASOS.add(GuiaCapitulo03.getPaso());
        PASOS.add(GuiaCapitulo04.getPaso());
        PASOS.add(GuiaCapitulo05.getPaso());
        PASOS.add(GuiaCapitulo06.getPaso());
        PASOS.add(GuiaCapitulo07.getPaso());
        PASOS.add(GuiaCapitulo08.getPaso());
        PASOS.add(GuiaCapitulo09.getPaso());
        PASOS.add(GuiaCapitulo10.getPaso());
        PASOS.add(GuiaCapitulo11.getPaso());
        PASOS.add(GuiaCapitulo12.getPaso());
        PASOS.add(GuiaCapitulo13.getPaso());
        PASOS.add(GuiaCapitulo14.getPaso());
        PASOS.add(GuiaCapitulo15.getPaso());
        PASOS.add(GuiaCapitulo16.getPaso());
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
