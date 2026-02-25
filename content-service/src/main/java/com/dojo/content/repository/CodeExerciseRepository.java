package com.dojo.content.repository;

import com.dojo.content.entity.CodeExercise;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface CodeExerciseRepository extends JpaRepository<CodeExercise, Long> {
    List<CodeExercise> findByBelt(String belt);
}
