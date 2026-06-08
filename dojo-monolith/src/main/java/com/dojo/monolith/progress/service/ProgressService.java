package com.dojo.monolith.progress.service;

import com.dojo.monolith.progress.dto.AnswerRequest;
import com.dojo.monolith.progress.dto.RankingEntryDto;
import com.dojo.monolith.progress.dto.RankingResponse;
import com.dojo.monolith.progress.entity.BeltProgress;
import com.dojo.monolith.progress.entity.UserProgress;
import com.dojo.monolith.progress.repository.BeltProgressRepository;
import com.dojo.monolith.progress.repository.UserProgressRepository;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.util.*;

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

    public RankingResponse getGlobalRanking(String currentUsername) {
        List<UserProgress> top10 = userProgressRepository.findTop10ByOrderByTotalCorrectDesc();
        List<RankingEntryDto> entries = new ArrayList<>();
        boolean userInTop = false;

        for (int i = 0; i < top10.size(); i++) {
            UserProgress up = top10.get(i);
            boolean isCurrent = up.getUserId().equals(currentUsername);
            if (isCurrent) userInTop = true;
            entries.add(new RankingEntryDto(i + 1, up.getUserId(), up.getTotalCorrect(), up.getTotalAttempted(), isCurrent));
        }

        RankingEntryDto currentUserEntry = null;
        if (!userInTop && currentUsername != null && !currentUsername.isBlank()) {
            UserProgress current = userProgressRepository.findByUserId(currentUsername).orElse(null);
            if (current != null && current.getTotalAttempted() > 0) {
                long rank = userProgressRepository.countByTotalCorrectGreaterThan(current.getTotalCorrect()) + 1;
                currentUserEntry = new RankingEntryDto((int) rank, current.getUserId(), current.getTotalCorrect(), current.getTotalAttempted(), true);
            }
        }

        return new RankingResponse("global", entries, currentUserEntry);
    }

    public RankingResponse getStreakRanking(String currentUsername) {
        List<UserProgress> top10 = userProgressRepository.findTop10ByOrderByBestStreakDesc();
        List<RankingEntryDto> entries = new ArrayList<>();
        boolean userInTop = false;

        for (int i = 0; i < top10.size(); i++) {
            UserProgress up = top10.get(i);
            boolean isCurrent = up.getUserId().equals(currentUsername);
            if (isCurrent) userInTop = true;
            entries.add(new RankingEntryDto(i + 1, up.getUserId(), up.getBestStreak(), up.getTotalAttempted(), isCurrent));
        }

        RankingEntryDto currentUserEntry = null;
        if (!userInTop && currentUsername != null && !currentUsername.isBlank()) {
            UserProgress current = userProgressRepository.findByUserId(currentUsername).orElse(null);
            if (current != null && current.getTotalAttempted() > 0) {
                long rank = userProgressRepository.countByBestStreakGreaterThan(current.getBestStreak()) + 1;
                currentUserEntry = new RankingEntryDto((int) rank, current.getUserId(), current.getBestStreak(), current.getTotalAttempted(), true);
            }
        }

        return new RankingResponse("streak", entries, currentUserEntry);
    }

    public RankingResponse getBeltsRanking(String currentUsername) {
        List<Object[]> top10 = beltProgressRepository.findTopByMasteredBelts(PageRequest.of(0, 10));
        List<RankingEntryDto> entries = new ArrayList<>();
        boolean userInTop = false;

        for (int i = 0; i < top10.size(); i++) {
            Object[] row = top10.get(i);
            String userId = (String) row[0];
            int masteredCount = ((Long) row[1]).intValue();
            boolean isCurrent = userId.equals(currentUsername);
            if (isCurrent) userInTop = true;
            entries.add(new RankingEntryDto(i + 1, userId, masteredCount, 0, isCurrent));
        }

        RankingEntryDto currentUserEntry = null;
        if (!userInTop && currentUsername != null && !currentUsername.isBlank()) {
            long myMastered = beltProgressRepository.countMasteredByUserId(currentUsername);
            if (myMastered > 0) {
                long rank = 1;
                for (Object[] row : beltProgressRepository.findTopByMasteredBelts(PageRequest.of(0, Integer.MAX_VALUE))) {
                    int count = ((Long) row[1]).intValue();
                    if (count > myMastered) {
                        rank++;
                    }
                }
                currentUserEntry = new RankingEntryDto((int) rank, currentUsername, (int) myMastered, 0, true);
            }
        }

        return new RankingResponse("belts", entries, currentUserEntry);
    }
}
