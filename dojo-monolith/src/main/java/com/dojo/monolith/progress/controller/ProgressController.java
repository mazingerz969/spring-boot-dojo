package com.dojo.monolith.progress.controller;

import com.dojo.monolith.progress.dto.AnswerRequest;
import com.dojo.monolith.progress.entity.BeltProgress;
import com.dojo.monolith.progress.entity.UserProgress;
import com.dojo.monolith.progress.service.ProgressService;
import jakarta.validation.Valid;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/progress")
public class ProgressController {
    private final ProgressService progressService;

    public ProgressController(ProgressService progressService) {
        this.progressService = progressService;
    }

    @PostMapping("/record")
    public ResponseEntity<Void> recordAnswer(@Valid @RequestBody AnswerRequest request) {
        progressService.recordAnswer(request);
        return ResponseEntity.ok().build();
    }

    @GetMapping("/{username}")
    public ResponseEntity<Map<String, Object>> getProgress(@PathVariable String username) {
        UserProgress progress = progressService.getProgress(username);
        List<BeltProgress> belts = progressService.getBeltProgress(username);
        return ResponseEntity.ok(Map.of(
                "progress", progress != null ? progress : Map.of(),
                "belts", belts
        ));
    }

    @GetMapping("/{username}/belts")
    public ResponseEntity<List<BeltProgress>> getBelts(@PathVariable String username) {
        return ResponseEntity.ok(progressService.getBeltProgress(username));
    }

    @GetMapping("/{username}/belts/{beltLevel}")
    public ResponseEntity<BeltProgress> getBeltLevel(@PathVariable String username, @PathVariable String beltLevel) {
        BeltProgress bp = progressService.getBeltProgressForLevel(username, beltLevel);
        if (bp == null) return ResponseEntity.notFound().build();
        return ResponseEntity.ok(bp);
    }

    @GetMapping("/ranking/global")
    public ResponseEntity<List<UserProgress>> rankingGlobal() {
        return ResponseEntity.ok(progressService.getRankingGlobal());
    }

    @GetMapping("/ranking/streak")
    public ResponseEntity<List<UserProgress>> rankingStreak() {
        return ResponseEntity.ok(progressService.getRankingStreak());
    }

    @GetMapping("/ranking/belts")
    public ResponseEntity<List<Map<String, Object>>> rankingBelts() {
        return ResponseEntity.ok(progressService.getRankingBelts());
    }
}
