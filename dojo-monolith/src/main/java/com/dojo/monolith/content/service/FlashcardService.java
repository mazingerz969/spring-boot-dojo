package com.dojo.monolith.content.service;

import com.dojo.monolith.content.entity.Flashcard;
import com.dojo.monolith.content.entity.UserFlashcardHistory;
import com.dojo.monolith.content.repository.FlashcardRepository;
import com.dojo.monolith.content.repository.UserFlashcardHistoryRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@Service
public class FlashcardService {
    private final FlashcardRepository flashcardRepository;
    private final UserFlashcardHistoryRepository historyRepository;

    public FlashcardService(FlashcardRepository flashcardRepository, UserFlashcardHistoryRepository historyRepository) {
        this.flashcardRepository = flashcardRepository;
        this.historyRepository = historyRepository;
    }

    public List<Flashcard> findAll() { return flashcardRepository.findAll(); }

    public Flashcard findById(Long id) {
        return flashcardRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Flashcard not found with id: " + id));
    }

    public List<Flashcard> findByDifficulty(String difficulty) { return flashcardRepository.findByDifficulty(difficulty); }
    public List<Flashcard> findByCategory(String category) { return flashcardRepository.findByCategory(category); }

    public Flashcard create(Flashcard flashcard) { return flashcardRepository.save(flashcard); }

    public Flashcard findNextForUser(String difficulty, String userId) {
        List<Flashcard> allCards = flashcardRepository.findByDifficulty(difficulty);
        if (allCards.isEmpty()) return null;

        List<UserFlashcardHistory> history = historyRepository.findByUserIdAndDifficultyOrderByPriority(userId, difficulty);
        Set<Long> seenIds = history.stream().map(h -> h.getFlashcard().getId()).collect(Collectors.toSet());

        // Return unseen cards first
        for (Flashcard card : allCards) {
            if (!seenIds.contains(card.getId())) return card;
        }

        // Then return by priority (highest priority = most wrong)
        if (!history.isEmpty()) return history.get(0).getFlashcard();

        return allCards.get(0);
    }

    @Transactional
    public void recordFlashcardAnswer(Long flashcardId, String userId, boolean correct) {
        Flashcard flashcard = findById(flashcardId);
        UserFlashcardHistory history = historyRepository.findByUserIdAndFlashcardId(userId, flashcardId)
                .orElseGet(() -> {
                    UserFlashcardHistory h = new UserFlashcardHistory();
                    h.setUserId(userId);
                    h.setFlashcard(flashcard);
                    h.setPriority(5);
                    return h;
                });

        if (correct) {
            history.setTimesCorrect(history.getTimesCorrect() + 1);
            history.setPriority(Math.max(0, history.getPriority() - 1));
        } else {
            history.setTimesWrong(history.getTimesWrong() + 1);
            history.setPriority(Math.min(10, history.getPriority() + 2));
        }
        history.setLastSeen(LocalDateTime.now());
        historyRepository.save(history);
    }
}
