package com.dojo.monolith.content.controller;

import com.dojo.monolith.content.entity.CodeExercise;
import com.dojo.monolith.content.service.CodeExerciseService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/exercises")
public class ExerciseController {

    private final CodeExerciseService exerciseService;

    public ExerciseController(CodeExerciseService exerciseService) {
        this.exerciseService = exerciseService;
    }

    @GetMapping
    public ResponseEntity<List<CodeExercise>> getAll() {
        return ResponseEntity.ok(exerciseService.findAll());
    }

    @GetMapping("/{id}")
    public ResponseEntity<CodeExercise> getById(@PathVariable Long id) {
        return ResponseEntity.ok(exerciseService.findById(id));
    }

    @PostMapping("/{id}/validate")
    public ResponseEntity<Map<String, Object>> validate(@PathVariable Long id, @RequestBody Map<String, String> body) {
        String code = body.get("code");
        return ResponseEntity.ok(exerciseService.validateCode(id, code));
    }
}
