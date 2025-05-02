package com.example.ssm.rental.service;

import com.example.ssm.rental.entity.FeedbackSurvey;
import java.util.List;

public interface FeedbackSurveyService {
    void saveFeedbackSurvey(FeedbackSurvey feedbackSurvey);
    List<FeedbackSurvey> findAll();
}
