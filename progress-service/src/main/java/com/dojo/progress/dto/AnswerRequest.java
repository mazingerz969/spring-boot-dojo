package com.dojo.progress.dto;

import jakarta.validation.constraints.NotBlank;

public class AnswerRequest {

    @NotBlank
    private String username;

    @NotBlank
    private String beltLevel;

    private boolean correct;

    public AnswerRequest() {}

    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }
    public String getBeltLevel() { return beltLevel; }
    public void setBeltLevel(String beltLevel) { this.beltLevel = beltLevel; }
    public boolean isCorrect() { return correct; }
    public void setCorrect(boolean correct) { this.correct = correct; }
}
