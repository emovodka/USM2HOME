package com.example.ssm.rental.controller.backend;

import com.example.ssm.rental.common.base.BaseController;
import com.example.ssm.rental.common.constant.Constant;
import com.example.ssm.rental.common.dto.JsonResult;
import com.example.ssm.rental.entity.User;
import com.example.ssm.rental.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Objects;

/**
 * 密码修改控制器
 */
@Controller
public class PasswordController extends BaseController {

    @Autowired
    private UserService userService;

    /**
     * 密码修改页面
     *
     * @param model
     * @return
     */
    @RequestMapping("/admin/password")
    public String password(Model model) {
        model.addAttribute("tab", "my-password");
        return "admin/my-password";
    }

    /**
     * 密码保存提交
     *
     * @return
     */
    @RequestMapping(value = "/admin/password/submit", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult submitPassword(@RequestParam("oldPassword") String oldPassword,
                                     @RequestParam("newPassword") String newPassword,
                                     @RequestParam("confirmPassword") String confirmPassword,
                                     HttpSession session) {
        if (newPassword.length() < 6 || newPassword.length() > 20) {
            return JsonResult.error("please input a password between 6 and 20 characters");
        }
        if (!Objects.equals(newPassword, confirmPassword)) {
            return JsonResult.error("the two passwords are not consistent");
        }

        User user = userService.get(getLoginUserId());
        if (user == null || !Objects.equals(user.getUserPass(), oldPassword)) {
            return JsonResult.error("old password is incorrect");
        }
        try {
            user.setUserPass(newPassword);
            userService.update(user);
            session.setAttribute(Constant.SESSION_USER_KEY, userService.get(getLoginUserId()));
        } catch (Exception e) {
            e.printStackTrace();
            return JsonResult.error("save password failed");
        }
        return JsonResult.success("save success");
    }
}
