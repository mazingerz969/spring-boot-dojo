package com.dojo.monolith.frontend.controller;

import com.dojo.monolith.content.entity.Flashcard;
import com.dojo.monolith.content.service.FlashcardService;
import com.dojo.monolith.progress.entity.BeltProgress;
import com.dojo.monolith.progress.entity.UserProgress;
import com.dojo.monolith.progress.service.ProgressService;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.*;

@Controller
public class DashboardController {

    private final FlashcardService flashcardService;
    private final ProgressService progressService;

    private static final List<String> BELT_NAMES = List.of("BLANCO", "AMARILLO", "NARANJA", "VERDE", "MARRON", "NEGRO");
    private static final List<String[]> BELT_ORDER = List.of(
            new String[]{"BLANCO", "Cinturón Blanco", " bg-light text-dark"},
            new String[]{"AMARILLO", "Cinturón Amarillo", " bg-warning text-dark"},
            new String[]{"NARANJA", "Cinturón Naranja", " bg-orange text-white"},
            new String[]{"VERDE", "Cinturón Verde", " bg-success text-white"},
            new String[]{"MARRON", "Cinturón Marrón", " bg-brown text-white"},
            new String[]{"NEGRO", "Cinturón Negro", " bg-dark text-white"}
    );

    public DashboardController(FlashcardService flashcardService, ProgressService progressService) {
        this.flashcardService = flashcardService;
        this.progressService = progressService;
    }

    @GetMapping("/dashboard")
    public String dashboard(HttpSession session, Model model) {
        String username = (String) session.getAttribute("username");
        if (username == null) return "redirect:/login";

        model.addAttribute("username", username);
        model.addAttribute("belts", BELT_ORDER);

        // Load flashcards per belt
        for (String belt : BELT_NAMES) {
            try {
                List<Flashcard> cards = flashcardService.findByDifficulty(belt);
                model.addAttribute("flashcards_" + belt, cards);
            } catch (Exception e) {
                model.addAttribute("flashcards_" + belt, List.of());
            }
        }

        // Load progress
        int totalCorrect = 0, totalAttempted = 0, currentStreak = 0, bestStreak = 0;
        Map<String, Boolean> unlockedMap = new HashMap<>();
        Map<String, Boolean> masteredMap = new HashMap<>();
        Map<String, Integer> percentageMap = new HashMap<>();

        try {
            UserProgress progress = progressService.getProgress(username);
            if (progress != null) {
                totalCorrect = progress.getTotalCorrect();
                totalAttempted = progress.getTotalAttempted();
                currentStreak = progress.getCurrentStreak();
                bestStreak = progress.getBestStreak();
            }

            List<BeltProgress> beltProgressList = progressService.getBeltProgress(username);
            Map<String, BeltProgress> beltMap = new HashMap<>();
            for (BeltProgress bp : beltProgressList) {
                beltMap.put(bp.getBeltLevel(), bp);
            }

            for (int i = 0; i < BELT_NAMES.size(); i++) {
                String belt = BELT_NAMES.get(i);
                boolean unlocked = (i == 0); // BLANCO always unlocked
                if (i > 0) {
                    BeltProgress prev = beltMap.get(BELT_NAMES.get(i - 1));
                    unlocked = prev != null && prev.isMastered();
                }
                unlockedMap.put(belt, unlocked);

                BeltProgress bp = beltMap.get(belt);
                masteredMap.put(belt, bp != null && bp.isMastered());
                percentageMap.put(belt, bp != null && bp.getAttemptCount() > 0
                        ? (int) ((bp.getCorrectCount() * 100.0) / bp.getAttemptCount()) : 0);
            }
        } catch (Exception e) {
            for (String belt : BELT_NAMES) {
                unlockedMap.put(belt, belt.equals("BLANCO"));
                masteredMap.put(belt, false);
                percentageMap.put(belt, 0);
            }
        }

        model.addAttribute("totalCorrect", totalCorrect);
        model.addAttribute("totalAttempted", totalAttempted);
        model.addAttribute("currentStreak", currentStreak);
        model.addAttribute("bestStreak", bestStreak);
        model.addAttribute("unlockedMap", unlockedMap);
        model.addAttribute("masteredMap", masteredMap);
        model.addAttribute("percentageMap", percentageMap);

        return "dashboard";
    }
}
