package com.dojo.content.service;

import com.dojo.content.dto.FlashcardRequest;
import com.dojo.content.entity.Flashcard;
import com.dojo.content.repository.FlashcardRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FlashcardService {

    private final FlashcardRepository flashcardRepository;

    public FlashcardService(FlashcardRepository flashcardRepository) {
        this.flashcardRepository = flashcardRepository;
    }

    public List<Flashcard> findAll() {
        return flashcardRepository.findAll();
    }

    public Flashcard findById(Long id) {
        return flashcardRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Flashcard not found with id: " + id));
    }

    public List<Flashcard> findByCategory(String category) {
        return flashcardRepository.findByCategory(category);
    }

    public List<Flashcard> findByDifficulty(String difficulty) {
        return flashcardRepository.findByDifficulty(difficulty);
    }

    public Flashcard create(FlashcardRequest request) {
        Flashcard flashcard = new Flashcard(
                request.getQuestion(),
                request.getAnswer(),
                request.getCategory(),
                request.getDifficulty()
        );
        return flashcardRepository.save(flashcard);
    }

    public Flashcard update(Long id, FlashcardRequest request) {
        Flashcard flashcard = findById(id);
        flashcard.setQuestion(request.getQuestion());
        flashcard.setAnswer(request.getAnswer());
        flashcard.setCategory(request.getCategory());
        flashcard.setDifficulty(request.getDifficulty());
        return flashcardRepository.save(flashcard);
    }

    public void delete(Long id) {
        if (!flashcardRepository.existsById(id)) {
            throw new IllegalArgumentException("Flashcard not found with id: " + id);
        }
        flashcardRepository.deleteById(id);
    }
}
