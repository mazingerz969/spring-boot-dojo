package com.dojo.progress.dto;

public class RankingEntryDto {
    private int rank;
    private String userId;
    private int value;
    private int totalAttempted;
    private boolean currentUser;

    public RankingEntryDto() {}

    public RankingEntryDto(int rank, String userId, int value, int totalAttempted, boolean currentUser) {
        this.rank = rank;
        this.userId = userId;
        this.value = value;
        this.totalAttempted = totalAttempted;
        this.currentUser = currentUser;
    }

    public int getRank() { return rank; }
    public void setRank(int rank) { this.rank = rank; }
    public String getUserId() { return userId; }
    public void setUserId(String userId) { this.userId = userId; }
    public int getValue() { return value; }
    public void setValue(int value) { this.value = value; }
    public int getTotalAttempted() { return totalAttempted; }
    public void setTotalAttempted(int totalAttempted) { this.totalAttempted = totalAttempted; }
    public boolean isCurrentUser() { return currentUser; }
    public void setCurrentUser(boolean currentUser) { this.currentUser = currentUser; }
}
