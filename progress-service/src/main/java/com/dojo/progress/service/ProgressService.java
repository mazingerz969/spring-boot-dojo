package com.dojo.progress.service;

import com.dojo.progress.dto.AnswerRequest;
import com.dojo.progress.entity.BeltProgress;
import com.dojo.progress.entity.UserProgress;
import com.dojo.progress.repository.BeltProgressRepository;
import com.dojo.progress.repository.UserProgressRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.util.List;

@Service
public class ProgressService {

    private final UserProgressRepository userProgressRepository;
    private final BeltProgressRepository beltProgressRepository;

    public ProgressService(UserProgressRepository userProgressRepository,
                           BeltProgressRepository beltProgressRepository) {
        this.userProgressRepository = userProgressRepository;
        this.beltProgressRepository = beltProgressRepository;
    }

    @Transactional
    public UserProgress recordAnswer(AnswerRequest request) {
        UserProgress userProgress = userProgressRepository.findByUserId(request.getUsername())
                .orElse(new UserProgress(request.getUsername()));

        userProgress.setTotalAttempted(userProgress.getTotalAttempted() + 1);

        if (request.isCorrect()) {
            userProgress.setTotalCorrect(userProgress.getTotalCorrect() + 1);
        }

        // Update streak
        LocalDate today = LocalDate.now();
        if (userProgress.getLastStudyDate() == null || !userProgress.getLastStudyDate().equals(today)) {
            if (userProgress.getLastStudyDate() != null
                    && userProgress.getLastStudyDate().plusDays(1).equals(today)) {
                userProgress.setCurrentStreak(userProgress.getCurrentStreak() + 1);
            } else if (userProgress.getLastStudyDate() == null || !userProgress.getLastStudyDate().equals(today)) {
                userProgress.setCurrentStreak(1);
            }
            userProgress.setLastStudyDate(today);
        }

        if (userProgress.getCurrentStreak() > userProgress.getBestStreak()) {
            userProgress.setBestStreak(userProgress.getCurrentStreak());
        }

        userProgressRepository.save(userProgress);

        // Update belt progress
        BeltProgress beltProgress = beltProgressRepository
                .findByUserIdAndBeltLevel(request.getUsername(), request.getBeltLevel())
                .orElse(new BeltProgress(request.getUsername(), request.getBeltLevel()));

        beltProgress.setAttemptCount(beltProgress.getAttemptCount() + 1);
        if (request.isCorrect()) {
            beltProgress.setCorrectCount(beltProgress.getCorrectCount() + 1);
        }

        // Mastered: 80% correct on 10+ attempts
        if (beltProgress.getAttemptCount() >= 10) {
            double percentage = (double) beltProgress.getCorrectCount() / beltProgress.getAttemptCount() * 100;
            beltProgress.setMastered(percentage >= 80.0);
        }

        beltProgressRepository.save(beltProgress);

        return userProgress;
    }

    public UserProgress getProgress(String username) {
        return userProgressRepository.findByUserId(username)
                .orElse(new UserProgress(username));
    }

    public List<BeltProgress> getBeltProgress(String username) {
        return beltProgressRepository.findByUserId(username);
    }

    public BeltProgress getBeltProgressForLevel(String username, String beltLevel) {
        return beltProgressRepository.findByUserIdAndBeltLevel(username, beltLevel)
                .orElse(new BeltProgress(username, beltLevel));
    }
}
