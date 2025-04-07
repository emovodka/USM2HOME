package com.example.ssm.rental.controller.backend;

import cn.hutool.http.HtmlUtil;
import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.ssm.rental.common.base.BaseController;
import com.example.ssm.rental.common.dto.JsonResult;
import com.example.ssm.rental.common.util.PageUtil;
import com.example.ssm.rental.common.util.StringUtils;
import com.example.ssm.rental.entity.Feedback;
import com.example.ssm.rental.entity.House;
import com.example.ssm.rental.entity.Feedback;
import com.example.ssm.rental.entity.User;
import com.example.ssm.rental.service.FeedbackService;
import com.example.ssm.rental.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Objects;

/**
 * 订单控制器
 *
 */
@Controller("backFeedbackController")
public class FeedbackController extends BaseController {

    @Autowired
    private FeedbackService feedbackService;

    @Autowired
    private UserService userService;

    /**
     * 反馈列表
     *
     * @param model
     * @return
     */
    @RequestMapping("/admin/feedback")
    public String allFeedback(@RequestParam(value = "page", defaultValue = "1") Integer pageNumber,
                              @RequestParam(value = "size", defaultValue = "6") Integer pageSize,
                              Model model) {
        Page page = PageUtil.initMpPage(pageNumber, pageSize);
        Feedback condition = new Feedback();
        // 如果不是管理员，查询自己的反馈，否则管理员查询所有的反馈、
        if (!loginUserIsAdmin()) {
            condition.setUserId(getLoginUserId());
        }
        Page<Feedback> feedbackPage = feedbackService.findAll(page, condition);
        for(Feedback item : feedbackPage.getRecords()) {
            User user = userService.get(item.getUserId());
            item.setUser(user == null ? new User() : user);
        }

        model.addAttribute("pageInfo", feedbackPage);

        model.addAttribute("tab", "feedback-list");
        model.addAttribute("pagePrefix", "/admin/feedback?");
        model.addAttribute("isAdmin", loginUserIsAdmin());
        return "admin/feedback-list";
    }


    /**
     * 回复反馈
     *
     * @return
     */
    @RequestMapping(value = "/admin/feedback/reply/submit", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult replySubmit(Feedback feedback) {
        try {
            feedbackService.update(feedback);
        } catch (Exception e) {
            e.printStackTrace();
            return JsonResult.error("save feedback failed");
        }
        return JsonResult.success("save success");
    }

    /**
     * 删除反馈
     *
     * @return
     */
    @RequestMapping(value = "/admin/feedback/delete", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult deleteFeedback(@RequestParam("id") Long id) {
        try {
            Feedback feedback = feedbackService.get(id);
            if (feedback == null) {
                return JsonResult.error("feedback not found");
            }
            if (!loginUserIsAdmin() && !Objects.equals(feedback.getUserId(), getLoginUserId())) {
                return JsonResult.error("no permission to delete, this is not your feedback");
            }
            feedbackService.delete(id);
        } catch (Exception e) {
            e.printStackTrace();
            return JsonResult.error("delete feedback failed");
        }
        return JsonResult.success("delete feedback success");
    }



    /**
     * 发布/编辑反馈信息
     *
     * @param model
     * @return
     */
    @RequestMapping("/admin/feedback/publish")
    public String publish(@RequestParam(value = "id", required = false) Long id, Model model) {
        Feedback feedback;
        if (id != null) {
            // 如果要编辑的反馈不存在，则跳转404
            feedback = feedbackService.get(id);
            if (feedback == null) {
                return this.renderNotFound();
            }
            // 如果编辑别人的反馈，则跳转403
            if (!loginUserIsAdmin() && !Objects.equals(feedback.getUserId(), getLoginUserId())) {
                return this.renderNotAllowAccess();
            }
        } else {
            feedback = new Feedback();
        }
        model.addAttribute("feedback", feedback);
        model.addAttribute("tab", "feedback-publish");
        return "admin/feedback-publish";
    }


    /**
     * 发布反馈提交
     *
     * @return
     */
    @RequestMapping(value = "/admin/feedback/publish/submit", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult publishSubmit(Feedback feedback, HttpSession session) {
        try {
            // 发布反馈，设置用户ID
            if (feedback.getId() == null) {
                feedback.setCreateTime(new Date());
                feedback.setUserId(getLoginUserId());
                feedback.setStatus(0);
            }
            feedback.setContent(HtmlUtil.cleanHtmlTag(feedback.getContent()));
            feedbackService.insertOrUpdate(feedback);
        } catch (Exception e) {
            e.printStackTrace();
            return JsonResult.error("publish failed, please fill in the complete information");
        }
        return JsonResult.success("publish success", feedback.getId());
    }


    /**
     * 反馈详情
     *
     * @param model
     * @return
     */
    @RequestMapping("/admin/feedback/detail/{id}")
    public String details(@PathVariable(value = "id") Long id, Model model) {
        Feedback feedback = feedbackService.get(id);
        if (feedback == null) {
            return this.renderNotFound();
        }
        User user = userService.get(feedback.getUserId());
        user = user == null ? new User() : user;
        feedback.setUser(user);

        model.addAttribute("feedback", feedback);
        model.addAttribute("tab", "feedback-list");
        return "admin/feedback-detail";
    }


}
