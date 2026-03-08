package com.dojo.monolith.content.service;

import com.dojo.monolith.content.entity.CodeExercise;
import com.dojo.monolith.content.repository.CodeExerciseRepository;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class CodeExerciseService {
    private final CodeExerciseRepository repository;

    public CodeExerciseService(CodeExerciseRepository repository) {
        this.repository = repository;
    }

    public List<CodeExercise> findAll() { return repository.findAll(); }

    public CodeExercise findById(Long id) {
        return repository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Exercise not found with id: " + id));
    }

    public List<CodeExercise> findByBelt(String belt) {
        return repository.findByBelt(belt.toUpperCase());
    }

    public Map<String, Object> validateCode(Long id, String userCode) {
        CodeExercise exercise = findById(id);
        Map<String, Object> result = new HashMap<>();

        if (exercise.getRequiredKeywords() == null || exercise.getRequiredKeywords().isEmpty()) {
            result.put("passed", true);
            result.put("score", 100);
            result.put("message", "Exercise completed!");
            return result;
        }

        String[] keywords = exercise.getRequiredKeywords().split(",");
        List<String> found = new ArrayList<>();
        List<String> missing = new ArrayList<>();

        for (String kw : keywords) {
            String trimmed = kw.trim();
            if (userCode.contains(trimmed)) found.add(trimmed);
            else missing.add(trimmed);
        }

        int score = (int) ((found.size() * 100.0) / keywords.length);
        result.put("passed", missing.isEmpty());
        result.put("score", score);
        result.put("foundKeywords", found);
        result.put("missingKeywords", missing);
        result.put("message", missing.isEmpty() ? "All keywords found!" : "Missing keywords: " + missing);
        return result;
    }
}
