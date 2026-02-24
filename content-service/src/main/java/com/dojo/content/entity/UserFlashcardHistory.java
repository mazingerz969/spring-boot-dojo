package com.dojo.content.entity;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "user_flashcard_history", uniqueConstraints = {
        @UniqueConstraint(columnNames = {"userId", "flashcard_id"})
})
public class UserFlashcardHistory {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String userId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "flashcard_id", nullable = false)
    private Flashcard flashcard;

    @Column(nullable = false)
    private int timesCorrect;

    @Column(nullable = false)
    private int timesWrong;

    @Column(nullable = false)
    private int priority;

    private LocalDateTime lastSeen;

    public UserFlashcardHistory() {}

    public UserFlashcardHistory(String userId, Flashcard flashcard) {
        this.userId = userId;
        this.flashcard = flashcard;
        this.timesCorrect = 0;
        this.timesWrong = 0;
        this.priority = 5;
    }

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public String getUserId() { return userId; }
    public void setUserId(String userId) { this.userId = userId; }
    public Flashcard getFlashcard() { return flashcard; }
    public void setFlashcard(Flashcard flashcard) { this.flashcard = flashcard; }
    public int getTimesCorrect() { return timesCorrect; }
    public void setTimesCorrect(int timesCorrect) { this.timesCorrect = timesCorrect; }
    public int getTimesWrong() { return timesWrong; }
    public void setTimesWrong(int timesWrong) { this.timesWrong = timesWrong; }
    public int getPriority() { return priority; }
    public void setPriority(int priority) { this.priority = priority; }
    public LocalDateTime getLastSeen() { return lastSeen; }
    public void setLastSeen(LocalDateTime lastSeen) { this.lastSeen = lastSeen; }
}
