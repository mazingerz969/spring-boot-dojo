package com.dojo.progress.dto;

import java.util.List;

public class RankingResponse {
    private String type;
    private List<RankingEntryDto> top10;
    private RankingEntryDto currentUser;

    public RankingResponse() {}

    public RankingResponse(String type, List<RankingEntryDto> top10, RankingEntryDto currentUser) {
        this.type = type;
        this.top10 = top10;
        this.currentUser = currentUser;
    }

    public String getType() { return type; }
    public void setType(String type) { this.type = type; }
    public List<RankingEntryDto> getTop10() { return top10; }
    public void setTop10(List<RankingEntryDto> top10) { this.top10 = top10; }
    public RankingEntryDto getCurrentUser() { return currentUser; }
    public void setCurrentUser(RankingEntryDto currentUser) { this.currentUser = currentUser; }
}
