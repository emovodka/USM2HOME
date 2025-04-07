package com.example.ssm.rental.controller.backend;

import com.example.ssm.rental.common.base.BaseController;
import com.example.ssm.rental.entity.User;
import com.example.ssm.rental.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

/**
 * 后台首页控制器
 *
 */
@Controller
public class AdminIndexController extends BaseController {

    @Autowired
    private UserService userService;

    /**
     * 后台首页
     *
     * @param model
     * @return
     */
    @RequestMapping("/admin")
    public String index(Model model, HttpSession session) {
//        User user = userService.findByUserName("admin");
//        session.setAttribute("user", user);
        if (loginUserIsAdmin() || loginUserIsOwner()) {
            return "redirect:/admin/house";
        }
        return "redirect:/admin/home";
    }

}
