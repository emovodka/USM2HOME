package com.example.ssm.rental.mapper;

import com.example.ssm.rental.entity.FeedbackSurvey;
import java.util.List;

public interface FeedbackSurveyMapper {
    int insertFeedbackSurvey(FeedbackSurvey feedbackSurvey);
    List<FeedbackSurvey> selectAll();
}
