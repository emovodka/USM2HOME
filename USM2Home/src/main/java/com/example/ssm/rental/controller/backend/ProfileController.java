package com.example.ssm.rental.controller.backend;

import com.example.ssm.rental.common.base.BaseController;
import com.example.ssm.rental.common.constant.Constant;
import com.example.ssm.rental.common.dto.JsonResult;
import com.example.ssm.rental.common.util.StringUtils;
import com.example.ssm.rental.entity.User;
import com.example.ssm.rental.service.MessageService;
import com.example.ssm.rental.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * 个人信息控制器
 *
 */
@Controller
public class ProfileController extends BaseController {

    @Autowired
    private UserService userService;

    @Autowired
    private MessageService messageService;

    /**
     * 个人信息页面
     *
     * @param model
     * @return
     */
    @RequestMapping("/admin/profile")
    public String profile(Model model) {
        User user = userService.get(getLoginUserId());
        model.addAttribute("user", user);
        model.addAttribute("tab", "my-profile");
        return "admin/my-profile";
    }




    /**
     * 个人信息保存提交
     *
     * @return
     */
    @RequestMapping(value = "/admin/profile/submit", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult submitProfile(User user, HttpSession session) {
        // Validate username
        if (StringUtils.isNoneEmpty(user.getUserName())) {
            if (user.getUserName().length() < 4 || user.getUserName().length() > 20) {
                return JsonResult.error("Username must be between 4 and 20 characters");
            }
            // Check if username is already taken (except current user)
            User existingUser = userService.findByUserName(user.getUserName());
            if (existingUser != null && !existingUser.getId().equals(getLoginUserId())) {
                return JsonResult.error("Username is already taken");
            }
        }

        // Validate display name
        if (StringUtils.isNoneEmpty(user.getUserDisplayName())) {
            if (user.getUserDisplayName().length() < 2 || user.getUserDisplayName().length() > 50) {
                return JsonResult.error("Name must be between 2 and 50 characters");
            }
        }

        // Validate ID format
        if (StringUtils.isNotEmpty(user.getIdCard())) {
            String idCard = user.getIdCard().trim();
            // MyKad format: YYMMDD-PB-XXXX
            boolean isValidMyKad = idCard.matches("^\\d{6}-\\d{2}-\\d{4}$");
            // China passport format: E12345678
            boolean isValidPassport = idCard.matches("^E\\d{8}$");
            
            if (!isValidMyKad && !isValidPassport) {
                return JsonResult.error("Invalid ID format. Please use either:\n" +
                    "MyKad format: YYMMDD-PB-XXXX (Example: 991231-07-1234)\n" +
                    "Passport format: E12345678");
            }
        }
        
        if (StringUtils.isNoneEmpty(user.getEmail()) && !user.getEmail().contains("@")) {
            return JsonResult.error("Invalid email format");
        }

        user.setId(getLoginUserId());
        try {
            userService.update(user);
            User dbUser = userService.get(getLoginUserId());
            dbUser.setNotReadMessageCount(messageService.countNotReadMessageSize(user.getId()));
            session.setAttribute(Constant.SESSION_USER_KEY, dbUser);
        } catch (Exception e) {
            e.printStackTrace();
            return JsonResult.error("Failed to save changes");
        }
        return JsonResult.success("Changes saved successfully");
    }

}
