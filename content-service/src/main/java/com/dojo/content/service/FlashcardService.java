package com.dojo.content.service;

import com.dojo.content.dto.FlashcardRequest;
import com.dojo.content.entity.Flashcard;
import com.dojo.content.entity.UserFlashcardHistory;
import com.dojo.content.repository.FlashcardRepository;
import com.dojo.content.repository.UserFlashcardHistoryRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.*;
import java.util.stream.Collectors;

@Service
public class FlashcardService {

    private final FlashcardRepository flashcardRepository;
    private final UserFlashcardHistoryRepository historyRepository;

    public FlashcardService(FlashcardRepository flashcardRepository,
                            UserFlashcardHistoryRepository historyRepository) {
        this.flashcardRepository = flashcardRepository;
        this.historyRepository = historyRepository;
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

    public List<Flashcard> findNextForUser(String difficulty, String userId) {
        List<Flashcard> allFlashcards = flashcardRepository.findByDifficulty(difficulty);
        if (userId == null || userId.isBlank()) {
            return allFlashcards;
        }

        List<UserFlashcardHistory> history = historyRepository
                .findByUserIdAndDifficultyOrderByPriority(userId, difficulty);

        Set<Long> seenIds = history.stream()
                .map(h -> h.getFlashcard().getId())
                .collect(Collectors.toSet());

        // Unseen flashcards first, then by priority (highest first)
        List<Flashcard> unseen = allFlashcards.stream()
                .filter(f -> !seenIds.contains(f.getId()))
                .collect(Collectors.toList());

        List<Flashcard> seenSorted = history.stream()
                .map(UserFlashcardHistory::getFlashcard)
                .collect(Collectors.toList());

        List<Flashcard> result = new ArrayList<>(unseen);
        result.addAll(seenSorted);
        return result;
    }

    @Transactional
    public UserFlashcardHistory recordFlashcardAnswer(Long flashcardId, String userId, boolean correct) {
        Flashcard flashcard = findById(flashcardId);
        UserFlashcardHistory history = historyRepository.findByUserIdAndFlashcardId(userId, flashcardId)
                .orElse(new UserFlashcardHistory(userId, flashcard));

        history.setLastSeen(LocalDateTime.now());
        if (correct) {
            history.setTimesCorrect(history.getTimesCorrect() + 1);
            history.setPriority(Math.max(0, history.getPriority() - 1));
        } else {
            history.setTimesWrong(history.getTimesWrong() + 1);
            history.setPriority(Math.min(10, history.getPriority() + 2));
        }

        return historyRepository.save(history);
    }
}
