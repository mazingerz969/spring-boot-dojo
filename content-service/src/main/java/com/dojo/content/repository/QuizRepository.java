package com.dojo.content.repository;

import com.dojo.content.entity.Quiz;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface QuizRepository extends JpaRepository<Quiz, Long> {

    List<Quiz> findByCategory(String category);

    List<Quiz> findByDifficulty(String difficulty);

    List<Quiz> findByCategoryAndDifficulty(String category, String difficulty);
}
