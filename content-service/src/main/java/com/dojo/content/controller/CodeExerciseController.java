package com.dojo.content.controller;

import com.dojo.content.entity.CodeExercise;
import com.dojo.content.service.CodeExerciseService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/exercises")
public class CodeExerciseController {

    private final CodeExerciseService service;

    public CodeExerciseController(CodeExerciseService service) {
        this.service = service;
    }

    @GetMapping
    public ResponseEntity<List<CodeExercise>> getAll() {
        return ResponseEntity.ok(service.findAll());
    }

    @GetMapping("/{id}")
    public ResponseEntity<CodeExercise> getById(@PathVariable Long id) {
        return ResponseEntity.ok(service.findById(id));
    }

    @GetMapping("/belt/{belt}")
    public ResponseEntity<List<CodeExercise>> getByBelt(@PathVariable String belt) {
        return ResponseEntity.ok(service.findByBelt(belt));
    }

    @PostMapping("/{id}/validate")
    public ResponseEntity<Map<String, Object>> validate(@PathVariable Long id,
                                                         @RequestBody Map<String, String> body) {
        String userCode = body.getOrDefault("code", "");
        return ResponseEntity.ok(service.validateCode(id, userCode));
    }

    @ExceptionHandler(IllegalArgumentException.class)
    public ResponseEntity<Map<String, String>> handleNotFound(IllegalArgumentException e) {
        return ResponseEntity.status(404).body(Map.of("error", e.getMessage()));
    }
}
