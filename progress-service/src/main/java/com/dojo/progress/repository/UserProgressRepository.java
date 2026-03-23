package com.dojo.progress.repository;

import com.dojo.progress.entity.UserProgress;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface UserProgressRepository extends JpaRepository<UserProgress, Long> {

    Optional<UserProgress> findByUserId(String userId);

    List<UserProgress> findTop10ByOrderByTotalCorrectDesc();

    List<UserProgress> findTop10ByOrderByBestStreakDesc();

    @Query("SELECT COUNT(u) FROM UserProgress u WHERE u.totalCorrect > :totalCorrect")
    long countByTotalCorrectGreaterThan(@Param("totalCorrect") int totalCorrect);

    @Query("SELECT COUNT(u) FROM UserProgress u WHERE u.bestStreak > :bestStreak")
    long countByBestStreakGreaterThan(@Param("bestStreak") int bestStreak);
}
