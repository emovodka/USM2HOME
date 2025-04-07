package com.example.ssm.rental.controller.backend;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.ssm.rental.common.base.BaseController;
import com.example.ssm.rental.common.dto.JsonResult;
import com.example.ssm.rental.common.enums.UserStatusEnum;
import com.example.ssm.rental.common.util.PageUtil;
import com.example.ssm.rental.entity.User;
import com.example.ssm.rental.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

/**
 * 用户列表控制器
 *
 */
@Controller("backUserController")
public class UserController extends BaseController {

    @Autowired
    private UserService userService;


    /**
     * 用户列表列表
     *
     * @param model
     * @return
     */
    @RequestMapping("/admin/user")
    public String allUser(@RequestParam(value = "page", defaultValue = "1") Integer pageNumber,
                          @RequestParam(value = "size", defaultValue = "10") Integer pageSize,
                          Model model) {
        Page page = PageUtil.initMpPage(pageNumber, pageSize);
        User condition = new User();
        Page<User> userPage = userService.findAll(page, condition);
        model.addAttribute("pageInfo", userPage);
        return "admin/user-list";
    }


    /**
     * 禁用用户
     *
     * @return
     */
    @RequestMapping(value = "/admin/user/disable", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult disableUser(@RequestParam("id") Long id) {
        try {
            User user = userService.get(id);
            if (user != null) {
                user.setStatus(UserStatusEnum.DISABLE.getValue());
                userService.update(user);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return JsonResult.error("disable user failed");
        }
        return JsonResult.success("disable user success");
    }


    /**
     * 启用用户
     *
     * @return
     */
    @RequestMapping(value = "/admin/user/enable", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult enableUser(@RequestParam("id") Long id) {
        try {
            User user = userService.get(id);
            if (user != null) {
                user.setStatus(UserStatusEnum.ENABLE.getValue());
                userService.update(user);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return JsonResult.error("enable user failed");
        }
        return JsonResult.success("enable user success");
    }

    /**
     * 删除用户
     *
     * @return
     */
    @RequestMapping(value = "/admin/user/delete", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult deleteUser2(@RequestParam("id") Long id) {
        userService.delete(id);
        return JsonResult.success("delete user success");
    }    
    
    

    /**
     * 个人信息页面
     *
     * @param model
     * @return
     */
    @RequestMapping("/admin/user/info")
    public String profile(@RequestParam("id") Long id, Model model) {
        // 只有管理员可以访问该接口
        if (!loginUserIsAdmin()) {
            return this.renderNotAllowAccess();
        }

        User user = userService.get(id);
        model.addAttribute("user", user);

        return "admin/user-info";
    }


    /**
     * 保存用户信息
     *
     * @return
     */
    @RequestMapping(value = "/admin/user", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult saveUser(User user) {
        // 校验用户名是否已经存在
        User check = userService.findByUserName(user.getUserName());
        if ((check != null && user.getId() == null) ||
                (check != null && user.getId() != null && !check.getId().equals(user.getId()))) {
            return JsonResult.error("username already exists");
        }
        userService.insertOrUpdate(user);
        return JsonResult.success("save success");
    }

}
