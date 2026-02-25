package com.dojo.content.service;

import com.dojo.content.entity.CodeExercise;
import com.dojo.content.repository.CodeExerciseRepository;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class CodeExerciseService {

    private final CodeExerciseRepository repository;

    public CodeExerciseService(CodeExerciseRepository repository) {
        this.repository = repository;
    }

    public List<CodeExercise> findAll() {
        return repository.findAll();
    }

    public CodeExercise findById(Long id) {
        return repository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Exercise not found: " + id));
    }

    public List<CodeExercise> findByBelt(String belt) {
        return repository.findByBelt(belt.toUpperCase());
    }

    public Map<String, Object> validateCode(Long id, String userCode) {
        CodeExercise exercise = findById(id);
        String[] keywords = exercise.getRequiredKeywords().split(",");

        List<String> missing = new ArrayList<>();
        List<String> found = new ArrayList<>();

        for (String keyword : keywords) {
            String kw = keyword.trim();
            if (userCode.contains(kw)) {
                found.add(kw);
            } else {
                missing.add(kw);
            }
        }

        boolean passed = missing.isEmpty();
        int score = keywords.length > 0 ? (found.size() * 100) / keywords.length : 0;

        Map<String, Object> result = new LinkedHashMap<>();
        result.put("passed", passed);
        result.put("score", score);
        result.put("foundKeywords", found);
        result.put("missingKeywords", missing);
        result.put("message", passed
                ? "¡Correcto! Tu código contiene todos los elementos necesarios. 🥋"
                : "Faltan algunos elementos clave. Revisa las pistas e inténtalo de nuevo.");
        return result;
    }
}
