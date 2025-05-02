package com.example.ssm.rental.service.impl;

import com.example.ssm.rental.entity.FeedbackSurvey;
import com.example.ssm.rental.mapper.FeedbackSurveyMapper;
import com.example.ssm.rental.service.FeedbackSurveyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class FeedbackSurveyServiceImpl implements FeedbackSurveyService {

    @Autowired
    private FeedbackSurveyMapper feedbackSurveyMapper;

    @Override
    public void saveFeedbackSurvey(FeedbackSurvey feedbackSurvey) {
        feedbackSurveyMapper.insertFeedbackSurvey(feedbackSurvey);
    }

    @Override
    public List<FeedbackSurvey> findAll() {
        return feedbackSurveyMapper.selectAll();
    }
}
