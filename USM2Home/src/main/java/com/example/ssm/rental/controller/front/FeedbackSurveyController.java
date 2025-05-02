package com.example.ssm.rental.controller.front;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.servlet.http.HttpSession;
import com.example.ssm.rental.entity.FeedbackSurvey;
import com.example.ssm.rental.service.FeedbackSurveyService;

@Controller
public class FeedbackSurveyController {

    @Autowired
    private FeedbackSurveyService feedbackSurveyService;

    @GetMapping("/admin/feedbackSurvey")
    public String feedbackSurveyPage() {
        return "admin/feedback-survey";
    }

    @PostMapping("/admin/feedbackSurvey/submit")
    public String submitFeedbackSurvey(FeedbackSurvey feedbackSurvey, HttpSession session) {
        // 假设登录后session里有userId
        Long userId = (Long) session.getAttribute("userId");
        feedbackSurvey.setUserId(userId);

        feedbackSurveyService.saveFeedbackSurvey(feedbackSurvey);

        // 提交后跳转到感谢页面或原页面
        return "redirect:/admin/feedbackSurvey?success=1";
    }
}
