package com.example.ssm.rental.controller.backend;

import com.example.ssm.rental.entity.FeedbackSurvey;
import com.example.ssm.rental.service.FeedbackSurveyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class FeedbackSurveyAdminController {

    @Autowired
    private FeedbackSurveyService feedbackSurveyService;

    @GetMapping("/admin/feedbackSurvey/dashboard")
    public String dashboard(Model model) {
        List<FeedbackSurvey> all = feedbackSurveyService.findAll();
        model.addAttribute("surveyList", all);

        // 统计总数
        int total = all.size();
        model.addAttribute("total", total);

        // 统计每题平均分
        double[] avg = new double[11];
        for (FeedbackSurvey s : all) {
            avg[0] += s.getQ1UiClear() == null ? 0 : s.getQ1UiClear();
            avg[1] += s.getQ2SearchEasy() == null ? 0 : s.getQ2SearchEasy();
            avg[2] += s.getQ3InfoTrue() == null ? 0 : s.getQ3InfoTrue();
            avg[3] += s.getQ4ContactValid() == null ? 0 : s.getQ4ContactValid();
            avg[4] += s.getQ5PicDesc() == null ? 0 : s.getQ5PicDesc();
            avg[5] += s.getQ6FoundHouse() == null ? 0 : s.getQ6FoundHouse();
            avg[6] += s.getQ7FavContact() == null ? 0 : s.getQ7FavContact();
            avg[7] += s.getQ8FlowSmooth() == null ? 0 : s.getQ8FlowSmooth();
            avg[8] += s.getQ9Satisfaction() == null ? 0 : s.getQ9Satisfaction();
            avg[9] += s.getQ10Recommend() == null ? 0 : s.getQ10Recommend();
            avg[10] += s.getQ11Bug() == null ? 0 : s.getQ11Bug();
        }
        for (int i = 0; i < avg.length; i++) {
            avg[i] = total == 0 ? 0 : Math.round(avg[i] * 10.0 / total) / 10.0;
        }
        model.addAttribute("avg", avg);

        return "admin/feedback-survey-dashboard";
    }
}
