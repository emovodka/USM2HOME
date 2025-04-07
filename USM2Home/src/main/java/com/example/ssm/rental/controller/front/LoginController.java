package com.example.ssm.rental.controller.front;

import cn.hutool.core.util.RandomUtil;
import com.example.ssm.rental.common.constant.Constant;
import com.example.ssm.rental.common.dto.JsonResult;
import com.example.ssm.rental.common.enums.HouseRentTypeEnum;
import com.example.ssm.rental.common.enums.UserStatusEnum;
import com.example.ssm.rental.common.util.MailUtil;
import com.example.ssm.rental.entity.House;
import com.example.ssm.rental.entity.User;
import com.example.ssm.rental.service.HouseService;
import com.example.ssm.rental.service.MessageService;
import com.example.ssm.rental.service.UserService;
import com.example.ssm.rental.common.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;
import java.util.Objects;


@Controller
public class LoginController {

    @Autowired
    private UserService userService;

    @Autowired
    private HouseService houseService;

    @Autowired
    private MessageService messageService;

    /**
     * 登录页面
     *
     * @return
     */
    @RequestMapping("/login")
    public String login(Model model) {
        // 最新整租
        List<House> recentWholeHouseList = houseService.findTopList(HouseRentTypeEnum.WHOLE.getValue(), Constant.INDEX_HOUSE_NUM);
        model.addAttribute("recentWholeHouseList", recentWholeHouseList);

        // 最新合租
        List<House> recentShareHouseList = houseService.findTopList(HouseRentTypeEnum.SHARE.getValue(), Constant.INDEX_HOUSE_NUM);
        model.addAttribute("recentShareHouseList", recentShareHouseList);

        model.addAttribute("openLogin", "Y");
        return "front/index";
    }


    /**
     * 登录提交
     *
     * @param userName
     * @return
     */
    @RequestMapping(value = "/login/submit", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult loginSubmit(@RequestParam("userName") String userName,
                                  @RequestParam("userPass") String userPass,
                                  HttpSession session) {
        // 查询用户名是否存在
        User user = userService.findByUserName(userName);
        if (user == null) {
            return JsonResult.error("user not found");
        }

        // 判断密码是否正确
        if (!Objects.equals(user.getUserPass(), userPass)) {
            return JsonResult.error("wrong password");
        }

        // 判断用户是否禁用
        if (Objects.equals(user.getStatus(), UserStatusEnum.DISABLE.getValue())) {
            return JsonResult.error("account has been frozen, please contact the administrator");
        }

        String msg = "login success";
        if (StringUtils.isEmpty(user.getIdCardImg())) {
            msg += ", please upload your ID card photo in your personal information";
        }
        // 登录成功
        user.setNotReadMessageCount(messageService.countNotReadMessageSize(user.getId()));
        session.setAttribute(Constant.SESSION_USER_KEY, user);
        return JsonResult.success(msg);
    }

    /**
     * 注册提交
     *
     * @param userName
     * @param userName
     * @param userPass
     * @param userDisplayName
     * @param email
     * @param phone
     * @param role
     * @return
     */
    @RequestMapping(value = "/register/submit", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult registerSubmit(@RequestParam("userName") String userName,
                                     @RequestParam("userPass") String userPass,
                                     @RequestParam("userDisplayName") String userDisplayName,
                                     @RequestParam("email") String email,
                                     @RequestParam("phone") String phone,
                                     @RequestParam("role") String role,
                                     HttpSession session) {
        // 判断用户名长度是否合法
        if (userName.length() < 4 || userName.length() > 20) {
            return JsonResult.error("invalid username length");
        }
        if (userPass.length() < 6 || userPass.length() > 20) {
            return JsonResult.error("invalid password length");
        }
        // 判断姓名长度是否合法
        if (userDisplayName.length() < 2 || userDisplayName.length() > 20) {
            return JsonResult.error("invalid name length");
        }
        // 判断邮箱长度是否合法
        if (email.length() < 5 || email.length() > 50) {
            return JsonResult.error("invalid email length");
        }
        // 判断手机长度是否合法
        if (phone.length() != 11) {
            return JsonResult.error("invalid phone length");
        }


        // 查询用户名是否存在
        User user = userService.findByUserName(userName);
        if (user != null) {
            return JsonResult.error("username already exists");
        }

        // 用户名不存在，则注册用户
        user = new User();
        user.setUserName(userName);
        user.setUserDisplayName(userDisplayName);
        user.setPhone(phone);
        user.setEmail(email);
//        user.setUserAvatar("/assets/img/default-avatar.jpg");
        user.setUserAvatar("https://eu.ui-avatars.com/api/?background=random&length=1&rounded=true&bold=true&name=" + user.getUserName());
        user.setUserPass(userPass);
        user.setRole(role);
        user.setCreateTime(new Date());
        user.setSex("not shown");
        user.setHobby("Not specified");
        user.setUserDesc("not filled yet");
        user.setJob("Other");
        try {
            userService.insert(user);
        } catch (Exception e) {
            e.printStackTrace();
            return JsonResult.error("registration failed");
        }
        // 注册成功，直接登录成功
        session.setAttribute(Constant.SESSION_USER_KEY, user);
        return JsonResult.success("registration success, please upload your ID card photo in your personal information");
    }


    /**
     * 找回密码提交
     *
     * @param userName
     * @return
     */
    @RequestMapping(value = "/forget/submit", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult forgetSubmit(@RequestParam("userName") String userName,
                                   @RequestParam("email") String email,
                                   HttpSession session) {
        // 查询用户名是否存在
        User user = userService.findByUserName(userName);
        if (user == null) {
            return JsonResult.error("user not found");
        }

        // 如果邮箱不一致
        if (!Objects.equals(email, user.getEmail())) {
            return JsonResult.error("username and email do not match");
        }

        // 如果一致，则重置密码
        String randomPass = RandomUtil.randomNumbers(8);
        try {
            MailUtil.sendMail(email, "reset password", "your new password is: " + randomPass);
            user.setUserPass(randomPass);
            userService.update(user);
            return JsonResult.success("password reset successfully, please check your email");
        } catch (MessagingException e) {
            e.printStackTrace();
            return JsonResult.error("email sending failed, password not reset successfully, please contact the administrator");
        }
    }

    /**
     * 退出登录，返回首页
     *
     * @param session
     * @return
     */
    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("user");
        session.invalidate();
        return "redirect:/";
    }


}
