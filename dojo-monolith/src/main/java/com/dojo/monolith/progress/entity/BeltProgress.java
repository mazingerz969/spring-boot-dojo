package com.dojo.monolith.progress.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "belt_progress", uniqueConstraints = @UniqueConstraint(columnNames = {"user_id", "belt_level"}))
public class BeltProgress {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "user_id")
    private String userId;

    @Column(name = "belt_level")
    private String beltLevel;

    private int correctCount;
    private int attemptCount;
    private boolean mastered;

    public BeltProgress() {}

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
