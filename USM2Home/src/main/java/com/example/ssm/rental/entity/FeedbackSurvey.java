package com.example.ssm.rental.entity;

import java.util.Date;

public class FeedbackSurvey {
    private Long id;
    private Long userId;
    private Integer q1UiClear;
    private Integer q2SearchEasy;
    private Integer q3InfoTrue;
    private Integer q4ContactValid;
    private Integer q5PicDesc;
    private Integer q6FoundHouse;
    private Integer q7FavContact;
    private Integer q8FlowSmooth;
    private Integer q9Satisfaction;
    private Integer q10Recommend;
    private Integer q11Bug;
    private String suggestion;
    private Date createTime;

    // getter and setter methods
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public Long getUserId() { return userId; }
    public void setUserId(Long userId) { this.userId = userId; }
    public Integer getQ1UiClear() { return q1UiClear; }
    public void setQ1UiClear(Integer q1UiClear) { this.q1UiClear = q1UiClear; }
    public Integer getQ2SearchEasy() { return q2SearchEasy; }
    public void setQ2SearchEasy(Integer q2SearchEasy) { this.q2SearchEasy = q2SearchEasy; }
    public Integer getQ3InfoTrue() { return q3InfoTrue; }
    public void setQ3InfoTrue(Integer q3InfoTrue) { this.q3InfoTrue = q3InfoTrue; }
    public Integer getQ4ContactValid() { return q4ContactValid; }
    public void setQ4ContactValid(Integer q4ContactValid) { this.q4ContactValid = q4ContactValid; }
    public Integer getQ5PicDesc() { return q5PicDesc; }
    public void setQ5PicDesc(Integer q5PicDesc) { this.q5PicDesc = q5PicDesc; }
    public Integer getQ6FoundHouse() { return q6FoundHouse; }
    public void setQ6FoundHouse(Integer q6FoundHouse) { this.q6FoundHouse = q6FoundHouse; }
    public Integer getQ7FavContact() { return q7FavContact; }
    public void setQ7FavContact(Integer q7FavContact) { this.q7FavContact = q7FavContact; }
    public Integer getQ8FlowSmooth() { return q8FlowSmooth; }
    public void setQ8FlowSmooth(Integer q8FlowSmooth) { this.q8FlowSmooth = q8FlowSmooth; }
    public Integer getQ9Satisfaction() { return q9Satisfaction; }
    public void setQ9Satisfaction(Integer q9Satisfaction) { this.q9Satisfaction = q9Satisfaction; }
    public Integer getQ10Recommend() { return q10Recommend; }
    public void setQ10Recommend(Integer q10Recommend) { this.q10Recommend = q10Recommend; }
    public Integer getQ11Bug() { return q11Bug; }
    public void setQ11Bug(Integer q11Bug) { this.q11Bug = q11Bug; }
    public String getSuggestion() { return suggestion; }
    public void setSuggestion(String suggestion) { this.suggestion = suggestion; }
    public Date getCreateTime() { return createTime; }
    public void setCreateTime(Date createTime) { this.createTime = createTime; }
}
