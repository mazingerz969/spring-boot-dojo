package com.dojo.content.repository;

import com.dojo.content.entity.Flashcard;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface FlashcardRepository extends JpaRepository<Flashcard, Long> {

    List<Flashcard> findByCategory(String category);

    List<Flashcard> findByDifficulty(String difficulty);

    List<Flashcard> findByCategoryAndDifficulty(String category, String difficulty);
}
