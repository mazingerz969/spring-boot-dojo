package com.dojo.monolith.content.controller;

import com.dojo.monolith.content.entity.Flashcard;
import com.dojo.monolith.content.entity.Quiz;
import com.dojo.monolith.content.service.FlashcardService;
import com.dojo.monolith.content.service.QuizService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/content")
public class ContentController {

    private final FlashcardService flashcardService;
    private final QuizService quizService;

    public ContentController(FlashcardService flashcardService, QuizService quizService) {
        this.flashcardService = flashcardService;
        this.quizService = quizService;
    }

    @GetMapping("/flashcards")
    public ResponseEntity<List<Flashcard>> getFlashcards(@RequestParam String difficulty) {
        return ResponseEntity.ok(flashcardService.findByDifficulty(difficulty));
    }

    @GetMapping("/flashcards/next")
    public ResponseEntity<Flashcard> getNextFlashcard(@RequestParam String difficulty, @RequestParam String userId) {
        Flashcard next = flashcardService.findNextForUser(difficulty, userId);
        if (next == null) return ResponseEntity.notFound().build();
        return ResponseEntity.ok(next);
    }

    @PostMapping("/flashcards/{id}/answer")
    public ResponseEntity<Void> answerFlashcard(@PathVariable Long id, @RequestBody Map<String, Object> body) {
        String userId = (String) body.get("userId");
        boolean correct = Boolean.TRUE.equals(body.get("correct"));
        flashcardService.recordFlashcardAnswer(id, userId, correct);
        return ResponseEntity.ok().build();
    }

    @GetMapping("/quizzes")
    public ResponseEntity<List<Quiz>> getQuizzes(@RequestParam String difficulty) {
        return ResponseEntity.ok(quizService.findByDifficulty(difficulty));
    }
}
