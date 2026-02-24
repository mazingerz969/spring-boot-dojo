package com.dojo.progress.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "belt_progress", uniqueConstraints = {
        @UniqueConstraint(columnNames = {"userId", "beltLevel"})
})
public class BeltProgress {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String userId;

    @Column(nullable = false)
    private String beltLevel;

    @Column(nullable = false)
    private int correctCount;

    @Column(nullable = false)
    private int attemptCount;

    @Column(nullable = false)
    private boolean mastered;

    public BeltProgress() {}

    public BeltProgress(String userId, String beltLevel) {
        this.userId = userId;
        this.beltLevel = beltLevel;
        this.correctCount = 0;
        this.attemptCount = 0;
        this.mastered = false;
    }

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public String getUserId() { return userId; }
    public void setUserId(String userId) { this.userId = userId; }
    public String getBeltLevel() { return beltLevel; }
    public void setBeltLevel(String beltLevel) { this.beltLevel = beltLevel; }
    public int getCorrectCount() { return correctCount; }
    public void setCorrectCount(int correctCount) { this.correctCount = correctCount; }
    public int getAttemptCount() { return attemptCount; }
    public void setAttemptCount(int attemptCount) { this.attemptCount = attemptCount; }
    public boolean isMastered() { return mastered; }
    public void setMastered(boolean mastered) { this.mastered = mastered; }
}
