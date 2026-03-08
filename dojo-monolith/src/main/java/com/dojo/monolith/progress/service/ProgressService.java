package com.dojo.monolith.progress.service;

import com.dojo.monolith.progress.dto.AnswerRequest;
import com.dojo.monolith.progress.entity.BeltProgress;
import com.dojo.monolith.progress.entity.UserProgress;
import com.dojo.monolith.progress.repository.BeltProgressRepository;
import com.dojo.monolith.progress.repository.UserProgressRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.util.List;

@Service
public class ProgressService {
    private final UserProgressRepository userProgressRepository;
    private final BeltProgressRepository beltProgressRepository;

    public ProgressService(UserProgressRepository userProgressRepository, BeltProgressRepository beltProgressRepository) {
        this.userProgressRepository = userProgressRepository;
        this.beltProgressRepository = beltProgressRepository;
    }

    @Transactional
    public void recordAnswer(AnswerRequest request) {
        UserProgress progress = userProgressRepository.findByUserId(request.getUsername())
                .orElseGet(() -> {
                    UserProgress p = new UserProgress();
                    p.setUserId(request.getUsername());
                    return p;
                });

        progress.setTotalAttempted(progress.getTotalAttempted() + 1);
        if (request.isCorrect()) {
            progress.setTotalCorrect(progress.getTotalCorrect() + 1);
        }

        LocalDate today = LocalDate.now();
        if (progress.getLastStudyDate() != null && progress.getLastStudyDate().equals(today.minusDays(1))) {
            progress.setCurrentStreak(progress.getCurrentStreak() + 1);
        } else if (progress.getLastStudyDate() == null || !progress.getLastStudyDate().equals(today)) {
            progress.setCurrentStreak(1);
        }
        if (progress.getCurrentStreak() > progress.getBestStreak()) {
            progress.setBestStreak(progress.getCurrentStreak());
        }
        progress.setLastStudyDate(today);
        userProgressRepository.save(progress);

        BeltProgress belt = beltProgressRepository.findByUserIdAndBeltLevel(request.getUsername(), request.getBeltLevel())
                .orElseGet(() -> {
                    BeltProgress b = new BeltProgress();
                    b.setUserId(request.getUsername());
                    b.setBeltLevel(request.getBeltLevel());
                    return b;
                });

        belt.setAttemptCount(belt.getAttemptCount() + 1);
        if (request.isCorrect()) {
            belt.setCorrectCount(belt.getCorrectCount() + 1);
        }
        if (belt.getAttemptCount() >= 10) {
            double pct = (double) belt.getCorrectCount() / belt.getAttemptCount();
            belt.setMastered(pct >= 0.8);
        }
        beltProgressRepository.save(belt);
    }

    public UserProgress getProgress(String username) {
        return userProgressRepository.findByUserId(username).orElse(null);
    }

    public List<BeltProgress> getBeltProgress(String username) {
        return beltProgressRepository.findByUserId(username);
    }

    public BeltProgress getBeltProgressForLevel(String username, String beltLevel) {
        return beltProgressRepository.findByUserIdAndBeltLevel(username, beltLevel).orElse(null);
    }
}
