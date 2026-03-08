package com.dojo.monolith.content.service;

import com.dojo.monolith.content.entity.Quiz;
import com.dojo.monolith.content.repository.QuizRepository;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class QuizService {
    private final QuizRepository quizRepository;

    public QuizService(QuizRepository quizRepository) {
        this.quizRepository = quizRepository;
    }

    public List<Quiz> findAll() { return quizRepository.findAll(); }

    public Quiz findById(Long id) {
        return quizRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Quiz not found with id: " + id));
    }

    public List<Quiz> findByCategory(String category) { return quizRepository.findByCategory(category); }
    public List<Quiz> findByDifficulty(String difficulty) { return quizRepository.findByDifficulty(difficulty); }

    public Quiz create(Quiz quiz) { return quizRepository.save(quiz); }
    public void delete(Long id) {
        if (!quizRepository.existsById(id)) throw new IllegalArgumentException("Quiz not found with id: " + id);
        quizRepository.deleteById(id);
    }
}
