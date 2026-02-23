package com.dojo.content.dto;

import jakarta.validation.constraints.NotBlank;

public class FlashcardRequest {

    @NotBlank
    private String question;

    @NotBlank
    private String answer;

    @NotBlank
    private String category;

    @NotBlank
    private String difficulty;

    public String getQuestion() { return question; }
    public void setQuestion(String question) { this.question = question; }
    public String getAnswer() { return answer; }
    public void setAnswer(String answer) { this.answer = answer; }
    public String getCategory() { return category; }
    public void setCategory(String category) { this.category = category; }
    public String getDifficulty() { return difficulty; }
    public void setDifficulty(String difficulty) { this.difficulty = difficulty; }
}
