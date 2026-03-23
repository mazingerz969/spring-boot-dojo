package com.dojo.progress.repository;

import com.dojo.progress.entity.BeltProgress;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface BeltProgressRepository extends JpaRepository<BeltProgress, Long> {

    Optional<BeltProgress> findByUserIdAndBeltLevel(String userId, String beltLevel);

    List<BeltProgress> findByUserId(String userId);

    @Query("SELECT b.userId, COUNT(b) as masteredCount FROM BeltProgress b WHERE b.mastered = true GROUP BY b.userId ORDER BY masteredCount DESC")
    List<Object[]> findTopByMasteredBelts(Pageable pageable);

    @Query("SELECT COUNT(b) FROM BeltProgress b WHERE b.userId = :userId AND b.mastered = true")
    long countMasteredByUserId(@Param("userId") String userId);
}
