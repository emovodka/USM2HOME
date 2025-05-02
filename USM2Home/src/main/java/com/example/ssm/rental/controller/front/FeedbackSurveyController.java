package com.example.ssm.rental.controller.front;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class FeedbackSurveyController {

    @GetMapping("/admin/feedbackSurvey")
    public String feedbackSurveyPage() {
        return "admin/feedback-survey";
    }

    // 后续会加POST方法
}
