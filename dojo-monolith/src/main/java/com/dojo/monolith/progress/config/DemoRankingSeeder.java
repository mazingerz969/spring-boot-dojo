package com.dojo.monolith.progress.config;

import com.dojo.monolith.auth.entity.User;
import com.dojo.monolith.auth.repository.UserRepository;
import com.dojo.monolith.progress.entity.BeltProgress;
import com.dojo.monolith.progress.entity.UserProgress;
import com.dojo.monolith.progress.repository.BeltProgressRepository;
import com.dojo.monolith.progress.repository.UserProgressRepository;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.time.LocalDate;
import java.util.List;

@Configuration
public class DemoRankingSeeder {

    private static final String DEMO_PASSWORD = "demo1234";
    private static final String MARKER_USER = "sensei_akira";

    record DemoUser(
            String username,
            String email,
            int totalCorrect,
            int totalAttempted,
            int currentStreak,
            int bestStreak,
            int daysAgoLastStudy,
            List<BeltSeed> belts
    ) {}

    record BeltSeed(String beltLevel, int correctCount, int attemptCount, boolean mastered) {}

    @Bean
    CommandLineRunner seedDemoRankingData(
            UserRepository userRepository,
            UserProgressRepository userProgressRepository,
            BeltProgressRepository beltProgressRepository,
            PasswordEncoder passwordEncoder
    ) {
        return args -> {
            if (userRepository.existsByUsername(MARKER_USER)) {
                return;
            }

            List<DemoUser> demoUsers = List.of(
                    new DemoUser("sensei_akira", "akira@dojo.demo", 178, 200, 12, 21, 0, List.of(
                            belt("BLANCO", 14, 15, true),
                            belt("AMARILLO", 16, 18, true),
                            belt("NARANJA", 15, 17, true),
                            belt("VERDE", 14, 16, true),
                            belt("MARRON", 13, 15, true),
                            belt("NEGRO", 12, 14, true)
                    )),
                    new DemoUser("dev_maria", "maria@dojo.demo", 165, 185, 9, 18, 0, List.of(
                            belt("BLANCO", 13, 14, true),
                            belt("AMARILLO", 14, 16, true),
                            belt("NARANJA", 13, 15, true),
                            belt("VERDE", 12, 14, true),
                            belt("MARRON", 11, 13, true),
                            belt("NEGRO", 7, 10, false)
                    )),
                    new DemoUser("spring_ninja", "ninja@dojo.demo", 148, 170, 7, 15, 0, List.of(
                            belt("BLANCO", 12, 13, true),
                            belt("AMARILLO", 13, 15, true),
                            belt("NARANJA", 12, 14, true),
                            belt("VERDE", 11, 13, true),
                            belt("MARRON", 6, 9, false),
                            belt("NEGRO", 3, 6, false)
                    )),
                    new DemoUser("java_samurai", "samurai@dojo.demo", 132, 155, 5, 11, 1, List.of(
                            belt("BLANCO", 11, 12, true),
                            belt("AMARILLO", 12, 14, true),
                            belt("NARANJA", 10, 12, true),
                            belt("VERDE", 5, 8, false),
                            belt("MARRON", 2, 5, false),
                            belt("NEGRO", 0, 0, false)
                    )),
                    new DemoUser("bean_master", "bean@dojo.demo", 115, 130, 10, 10, 0, List.of(
                            belt("BLANCO", 10, 11, true),
                            belt("AMARILLO", 11, 13, true),
                            belt("NARANJA", 8, 10, true),
                            belt("VERDE", 4, 7, false),
                            belt("MARRON", 0, 0, false),
                            belt("NEGRO", 0, 0, false)
                    )),
                    new DemoUser("boot_pupil", "pupil@dojo.demo", 98, 120, 4, 8, 0, List.of(
                            belt("BLANCO", 10, 12, true),
                            belt("AMARILLO", 9, 11, true),
                            belt("NARANJA", 5, 8, false),
                            belt("VERDE", 0, 0, false),
                            belt("MARRON", 0, 0, false),
                            belt("NEGRO", 0, 0, false)
                    )),
                    new DemoUser("jpa_wizard", "wizard@dojo.demo", 89, 110, 3, 9, 2, List.of(
                            belt("BLANCO", 9, 10, true),
                            belt("AMARILLO", 8, 10, true),
                            belt("NARANJA", 4, 7, false),
                            belt("VERDE", 0, 0, false),
                            belt("MARRON", 0, 0, false),
                            belt("NEGRO", 0, 0, false)
                    )),
                    new DemoUser("kata_rookie", "rookie@dojo.demo", 76, 95, 2, 6, 0, List.of(
                            belt("BLANCO", 9, 11, true),
                            belt("AMARILLO", 4, 7, false),
                            belt("NARANJA", 0, 0, false),
                            belt("VERDE", 0, 0, false),
                            belt("MARRON", 0, 0, false),
                            belt("NEGRO", 0, 0, false)
                    )),
                    new DemoUser("api_guru", "guru@dojo.demo", 64, 85, 1, 5, 1, List.of(
                            belt("BLANCO", 8, 10, true),
                            belt("AMARILLO", 3, 6, false),
                            belt("NARANJA", 0, 0, false),
                            belt("VERDE", 0, 0, false),
                            belt("MARRON", 0, 0, false),
                            belt("NEGRO", 0, 0, false)
                    )),
                    new DemoUser("dojo_newbie", "newbie@dojo.demo", 52, 75, 1, 3, 0, List.of(
                            belt("BLANCO", 5, 8, false),
                            belt("AMARILLO", 2, 5, false),
                            belt("NARANJA", 0, 0, false),
                            belt("VERDE", 0, 0, false),
                            belt("MARRON", 0, 0, false),
                            belt("NEGRO", 0, 0, false)
                    ))
            );

            String encodedPassword = passwordEncoder.encode(DEMO_PASSWORD);

            for (DemoUser demo : demoUsers) {
                userRepository.save(new User(demo.username(), demo.email(), encodedPassword, "USER"));

                UserProgress progress = new UserProgress();
                progress.setUserId(demo.username());
                progress.setTotalCorrect(demo.totalCorrect());
                progress.setTotalAttempted(demo.totalAttempted());
                progress.setCurrentStreak(demo.currentStreak());
                progress.setBestStreak(demo.bestStreak());
                progress.setLastStudyDate(LocalDate.now().minusDays(demo.daysAgoLastStudy()));
                userProgressRepository.save(progress);

                for (BeltSeed beltSeed : demo.belts()) {
                    if (beltSeed.attemptCount() == 0) {
                        continue;
                    }
                    BeltProgress belt = new BeltProgress();
                    belt.setUserId(demo.username());
                    belt.setBeltLevel(beltSeed.beltLevel());
                    belt.setCorrectCount(beltSeed.correctCount());
                    belt.setAttemptCount(beltSeed.attemptCount());
                    belt.setMastered(beltSeed.mastered());
                    beltProgressRepository.save(belt);
                }
            }
        };
    }

    private static BeltSeed belt(String beltLevel, int correctCount, int attemptCount, boolean mastered) {
        return new BeltSeed(beltLevel, correctCount, attemptCount, mastered);
    }
}
