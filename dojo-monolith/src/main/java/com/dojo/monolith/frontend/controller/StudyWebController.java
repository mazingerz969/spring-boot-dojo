package com.dojo.monolith.frontend.controller;

import com.dojo.monolith.content.entity.Flashcard;
import com.dojo.monolith.content.service.FlashcardService;
import com.dojo.monolith.progress.dto.AnswerRequest;
import com.dojo.monolith.progress.service.ProgressService;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class StudyWebController {

    private final FlashcardService flashcardService;
    private final ProgressService progressService;

    public StudyWebController(FlashcardService flashcardService, ProgressService progressService) {
        this.flashcardService = flashcardService;
        this.progressService = progressService;
    }

    @GetMapping("/study")
    public String study(@RequestParam(defaultValue = "BLANCO") String difficulty,
                        HttpSession session, Model model) {
        String username = (String) session.getAttribute("username");
        if (username == null) return "redirect:/login";

        List<Flashcard> flashcards;
        try {
            Flashcard next = flashcardService.findNextForUser(difficulty, username);
            flashcards = next != null ? List.of(next) : flashcardService.findByDifficulty(difficulty);
        } catch (Exception e) {
            flashcards = flashcardService.findByDifficulty(difficulty);
        }

        model.addAttribute("flashcards", flashcards);
        model.addAttribute("difficulty", difficulty);
        model.addAttribute("username", username);

        return "study";
    }

    @PostMapping("/study/answer")
    public String recordAnswer(@RequestParam Long flashcardId,
                               @RequestParam boolean correct,
                               @RequestParam String difficulty,
                               HttpSession session) {
        String username = (String) session.getAttribute("username");
        if (username == null) return "redirect:/login";

        try {
            flashcardService.recordFlashcardAnswer(flashcardId, username, correct);
        } catch (Exception ignored) {}

        try {
            AnswerRequest req = new AnswerRequest();
            req.setUsername(username);
            req.setBeltLevel(difficulty);
            req.setCorrect(correct);
            progressService.recordAnswer(req);
        } catch (Exception ignored) {}

        return "redirect:/study?difficulty=" + difficulty;
    }
}
