package com.dojo.monolith.frontend.controller;

import com.dojo.monolith.content.entity.CodeExercise;
import com.dojo.monolith.content.service.CodeExerciseService;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.*;
import java.util.stream.Collectors;

@Controller
public class ExerciseWebController {

    private final CodeExerciseService codeExerciseService;

    private static final List<String> BELT_ORDER = List.of("BLANCO", "AMARILLO", "NARANJA", "VERDE", "MARRON", "NEGRO");

    public ExerciseWebController(CodeExerciseService codeExerciseService) {
        this.codeExerciseService = codeExerciseService;
    }

    @GetMapping("/exercises")
    public String listExercises(HttpSession session, Model model) {
        String username = (String) session.getAttribute("username");
        if (username == null) return "redirect:/login";

        List<CodeExercise> all = codeExerciseService.findAll();
        Map<String, List<CodeExercise>> grouped = all.stream()
                .collect(Collectors.groupingBy(CodeExercise::getBelt));

        model.addAttribute("exercisesByBelt", grouped);
        model.addAttribute("beltOrder", BELT_ORDER);
        return "exercises";
    }

    @GetMapping("/exercises/{id}")
    public String exerciseDetail(@PathVariable Long id, HttpSession session, Model model) {
        String username = (String) session.getAttribute("username");
        if (username == null) return "redirect:/login";

        CodeExercise exercise = codeExerciseService.findById(id);
        model.addAttribute("exercise", exercise);
        return "exercise-detail";
    }

    @PostMapping("/exercises/{id}/validate")
    public String validateExercise(@PathVariable Long id, @RequestParam String code,
                                   HttpSession session, Model model) {
        String username = (String) session.getAttribute("username");
        if (username == null) return "redirect:/login";

        CodeExercise exercise = codeExerciseService.findById(id);
        Map<String, Object> result = codeExerciseService.validateCode(id, code);

        model.addAttribute("exercise", exercise);
        model.addAttribute("result", result);
        model.addAttribute("userCode", code);
        return "exercise-detail";
    }
}
