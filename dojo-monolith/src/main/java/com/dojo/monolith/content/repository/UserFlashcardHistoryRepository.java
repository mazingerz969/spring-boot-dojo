package com.dojo.monolith.content.repository;

import com.dojo.monolith.content.entity.UserFlashcardHistory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import java.util.List;
import java.util.Optional;

public interface UserFlashcardHistoryRepository extends JpaRepository<UserFlashcardHistory, Long> {
    Optional<UserFlashcardHistory> findByUserIdAndFlashcardId(String userId, Long flashcardId);
    List<UserFlashcardHistory> findByUserId(String userId);

    @Query("SELECT h FROM UserFlashcardHistory h WHERE h.userId = :userId AND h.flashcard.difficulty = :difficulty ORDER BY h.priority DESC, h.lastSeen ASC")
    List<UserFlashcardHistory> findByUserIdAndDifficultyOrderByPriority(@Param("userId") String userId, @Param("difficulty") String difficulty);
}
