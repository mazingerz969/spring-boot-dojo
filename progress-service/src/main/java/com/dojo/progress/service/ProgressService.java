package com.dojo.progress.service;

import com.dojo.progress.dto.AnswerRequest;
import com.dojo.progress.dto.RankingEntryDto;
import com.dojo.progress.dto.RankingResponse;
import com.dojo.progress.entity.BeltProgress;
import com.dojo.progress.entity.UserProgress;
import com.dojo.progress.repository.BeltProgressRepository;
import com.dojo.progress.repository.UserProgressRepository;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.util.ArrayList;
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
        if (!userInTop) {
            UserProgress current = userProgressRepository.findByUserId(currentUsername).orElse(null);
            if (current != null) {
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
        if (!userInTop) {
            UserProgress current = userProgressRepository.findByUserId(currentUsername).orElse(null);
            if (current != null) {
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
            String uId = (String) row[0];
            int masteredCount = ((Long) row[1]).intValue();
            boolean isCurrent = uId.equals(currentUsername);
            if (isCurrent) userInTop = true;
            entries.add(new RankingEntryDto(i + 1, uId, masteredCount, 0, isCurrent));
        }

        RankingEntryDto currentUserEntry = null;
        if (!userInTop) {
            long myMastered = beltProgressRepository.countMasteredByUserId(currentUsername);
            if (myMastered > 0) {
                // Count how many users have more mastered belts
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
