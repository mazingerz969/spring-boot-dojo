package com.dojo.monolith.content.entity;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "code_exercises")
public class CodeExercise {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String title;

    @Column(length = 2000)
    private String description;

    @Column(nullable = false)
    private String belt;

    @Column(name = "starter_code", length = 3000)
    private String starterCode;

    @Column(length = 3000)
    private String solution;

    @Column(name = "required_keywords", length = 1000)
    private String requiredKeywords;

    @Column(length = 1000)
    private String hints;

    @Column(name = "created_at", nullable = false, updatable = false)
    private LocalDateTime createdAt;

    @PrePersist
    protected void onCreate() { this.createdAt = LocalDateTime.now(); }

    public CodeExercise() {}

    public CodeExercise(String title, String description, String belt, String starterCode, String solution, String requiredKeywords, String hints) {
        this.title = title; this.description = description; this.belt = belt;
        this.starterCode = starterCode; this.solution = solution;
        this.requiredKeywords = requiredKeywords; this.hints = hints;
    }

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
    public String getBelt() { return belt; }
    public void setBelt(String belt) { this.belt = belt; }
    public String getStarterCode() { return starterCode; }
    public void setStarterCode(String starterCode) { this.starterCode = starterCode; }
    public String getSolution() { return solution; }
    public void setSolution(String solution) { this.solution = solution; }
    public String getRequiredKeywords() { return requiredKeywords; }
    public void setRequiredKeywords(String requiredKeywords) { this.requiredKeywords = requiredKeywords; }
    public String getHints() { return hints; }
    public void setHints(String hints) { this.hints = hints; }
    public LocalDateTime getCreatedAt() { return createdAt; }
    public void setCreatedAt(LocalDateTime createdAt) { this.createdAt = createdAt; }
}
