package com.dojo.content.controller;

import com.dojo.content.dto.FlashcardRequest;
import com.dojo.content.entity.Flashcard;
import com.dojo.content.entity.UserFlashcardHistory;
import com.dojo.content.service.FlashcardService;
import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/flashcards")
public class FlashcardController {

    private final FlashcardService flashcardService;

    public FlashcardController(FlashcardService flashcardService) {
        this.flashcardService = flashcardService;
    }

    @GetMapping
    public ResponseEntity<List<Flashcard>> getAll(
            @RequestParam(required = false) String category,
            @RequestParam(required = false) String difficulty) {
        List<Flashcard> flashcards;
        if (category != null) {
            flashcards = flashcardService.findByCategory(category);
        } else if (difficulty != null) {
            flashcards = flashcardService.findByDifficulty(difficulty);
        } else {
            flashcards = flashcardService.findAll();
        }
        return ResponseEntity.ok(flashcards);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Flashcard> getById(@PathVariable Long id) {
        return ResponseEntity.ok(flashcardService.findById(id));
    }

    @PostMapping
    public ResponseEntity<Flashcard> create(@Valid @RequestBody FlashcardRequest request) {
        return ResponseEntity.status(HttpStatus.CREATED).body(flashcardService.create(request));
    }

    @PutMapping("/{id}")
    public ResponseEntity<Flashcard> update(@PathVariable Long id,
                                            @Valid @RequestBody FlashcardRequest request) {
        return ResponseEntity.ok(flashcardService.update(id, request));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> delete(@PathVariable Long id) {
        flashcardService.delete(id);
        return ResponseEntity.noContent().build();
    }

    @GetMapping("/next")
    public ResponseEntity<List<Flashcard>> getNext(
            @RequestParam String difficulty,
            @RequestParam(required = false) String userId) {
        List<Flashcard> flashcards = flashcardService.findNextForUser(difficulty, userId);
        return ResponseEntity.ok(flashcards);
    }

    @PostMapping("/{id}/answer")
    public ResponseEntity<Map<String, Object>> recordAnswer(
            @PathVariable Long id,
            @RequestParam String userId,
            @RequestParam boolean correct) {
        UserFlashcardHistory history = flashcardService.recordFlashcardAnswer(id, userId, correct);
        return ResponseEntity.ok(Map.of(
                "flashcardId", id,
                "priority", history.getPriority(),
                "timesCorrect", history.getTimesCorrect(),
                "timesWrong", history.getTimesWrong()
        ));
    }

    @ExceptionHandler(IllegalArgumentException.class)
    public ResponseEntity<Map<String, String>> handleNotFound(IllegalArgumentException e) {
        return ResponseEntity.status(HttpStatus.NOT_FOUND).body(Map.of("error", e.getMessage()));
    }
}
