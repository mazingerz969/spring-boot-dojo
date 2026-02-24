package com.dojo.content.service;

import com.dojo.content.dto.QuizRequest;
import com.dojo.content.entity.Quiz;
import com.dojo.content.repository.QuizRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class QuizService {

    private final QuizRepository quizRepository;

    public QuizService(QuizRepository quizRepository) {
        this.quizRepository = quizRepository;
    }

    public List<Quiz> findAll() {
        return quizRepository.findAll();
    }

    public Quiz findById(Long id) {
        return quizRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Quiz not found with id: " + id));
    }

    public List<Quiz> findByCategory(String category) {
        return quizRepository.findByCategory(category);
    }

    public List<Quiz> findByDifficulty(String difficulty) {
        return quizRepository.findByDifficulty(difficulty);
    }

    public Quiz create(QuizRequest request) {
        Quiz quiz = new Quiz(
                request.getQuestion(),
                request.getOptionA(),
                request.getOptionB(),
                request.getOptionC(),
                request.getOptionD(),
                request.getCorrectOption(),
                request.getCategory(),
                request.getDifficulty()
        );
        return quizRepository.save(quiz);
    }

    public Quiz update(Long id, QuizRequest request) {
        Quiz quiz = findById(id);
        quiz.setQuestion(request.getQuestion());
        quiz.setOptionA(request.getOptionA());
        quiz.setOptionB(request.getOptionB());
        quiz.setOptionC(request.getOptionC());
        quiz.setOptionD(request.getOptionD());
        quiz.setCorrectOption(request.getCorrectOption());
        quiz.setCategory(request.getCategory());
        quiz.setDifficulty(request.getDifficulty());
        return quizRepository.save(quiz);
    }

    public void delete(Long id) {
        if (!quizRepository.existsById(id)) {
            throw new IllegalArgumentException("Quiz not found with id: " + id);
        }
        quizRepository.deleteById(id);
    }
}
