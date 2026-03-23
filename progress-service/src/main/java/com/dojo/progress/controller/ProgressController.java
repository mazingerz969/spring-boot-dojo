package com.dojo.progress.controller;

import com.dojo.progress.dto.AnswerRequest;
import com.dojo.progress.dto.RankingResponse;
import com.dojo.progress.entity.BeltProgress;
import com.dojo.progress.entity.UserProgress;
import com.dojo.progress.service.ProgressService;
import jakarta.validation.Valid;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/progress")
public class ProgressController {

    private final ProgressService progressService;

    public ProgressController(ProgressService progressService) {
        this.progressService = progressService;
    }

    @PostMapping("/record")
    public ResponseEntity<UserProgress> recordAnswer(@Valid @RequestBody AnswerRequest request) {
        return ResponseEntity.ok(progressService.recordAnswer(request));
    }

    @GetMapping("/{username}")
    public ResponseEntity<Map<String, Object>> getProgress(@PathVariable String username) {
        UserProgress progress = progressService.getProgress(username);
        List<BeltProgress> belts = progressService.getBeltProgress(username);
        return ResponseEntity.ok(Map.of(
                "userProgress", progress,
                "beltProgress", belts
        ));
    }

    @GetMapping("/{username}/streak")
    public ResponseEntity<Map<String, Object>> getStreak(@PathVariable String username) {
        UserProgress progress = progressService.getProgress(username);
        return ResponseEntity.ok(Map.of(
                "currentStreak", progress.getCurrentStreak(),
                "bestStreak", progress.getBestStreak(),
                "lastStudyDate", progress.getLastStudyDate() != null ? progress.getLastStudyDate().toString() : ""
        ));
    }

    @GetMapping("/{username}/belts")
    public ResponseEntity<List<BeltProgress>> getBeltProgress(@PathVariable String username) {
        return ResponseEntity.ok(progressService.getBeltProgress(username));
    }

    @GetMapping("/{username}/belts/{beltLevel}")
    public ResponseEntity<BeltProgress> getBeltProgressForLevel(
            @PathVariable String username, @PathVariable String beltLevel) {
        return ResponseEntity.ok(progressService.getBeltProgressForLevel(username, beltLevel));
    }

    @GetMapping("/ranking/global")
    public ResponseEntity<RankingResponse> getGlobalRanking(@RequestParam String username) {
        return ResponseEntity.ok(progressService.getGlobalRanking(username));
    }

    @GetMapping("/ranking/streak")
    public ResponseEntity<RankingResponse> getStreakRanking(@RequestParam String username) {
        return ResponseEntity.ok(progressService.getStreakRanking(username));
    }

    @GetMapping("/ranking/belts")
    public ResponseEntity<RankingResponse> getBeltsRanking(@RequestParam String username) {
        return ResponseEntity.ok(progressService.getBeltsRanking(username));
    }
}
