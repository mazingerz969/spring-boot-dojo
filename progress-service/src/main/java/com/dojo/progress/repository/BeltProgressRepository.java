package com.dojo.progress.repository;

import com.dojo.progress.entity.BeltProgress;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface BeltProgressRepository extends JpaRepository<BeltProgress, Long> {

    Optional<BeltProgress> findByUserIdAndBeltLevel(String userId, String beltLevel);

    List<BeltProgress> findByUserId(String userId);
}
