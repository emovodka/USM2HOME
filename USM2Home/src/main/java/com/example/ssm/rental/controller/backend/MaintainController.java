package com.example.ssm.rental.controller.backend;

import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.ssm.rental.common.base.BaseController;
import com.example.ssm.rental.common.constant.Constant;
import com.example.ssm.rental.common.dto.JsonResult;
import com.example.ssm.rental.common.util.PageUtil;
import com.example.ssm.rental.entity.House;
import com.example.ssm.rental.entity.Maintain;
import com.example.ssm.rental.entity.User;
import com.example.ssm.rental.service.HouseService;
import com.example.ssm.rental.service.MaintainService;
import com.example.ssm.rental.service.UserService;
import com.example.ssm.rental.common.util.StringUtils;
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
 */
@Controller("backMaintainController")
public class MaintainController extends BaseController {

    @Autowired
    private MaintainService maintainService;

    @Autowired
    private HouseService houseService;

    @Autowired
    private UserService userService;


    /**
     * 报修列表
     *
     * @param model
     * @return
     */
    @RequestMapping("/admin/maintain")
    public String allMaintain(@RequestParam(value = "page", defaultValue = "1") Integer pageNumber,
                              @RequestParam(value = "size", defaultValue = "6") Integer pageSize,
                              Model model) {
        Page page = PageUtil.initMpPage(pageNumber, pageSize);
        // 如果不是管理员，查询自己的报修，否则管理员查询所有的报修
        QueryWrapper<Maintain> queryWrapper = new QueryWrapper<>();
        if (!loginUserIsAdmin()) {
            List<Long> houseList = houseService.getHouseIdsByUserId(getLoginUserId());

            queryWrapper.eq("user_id", getLoginUserId());

            if(houseList.size() > 0) {
                queryWrapper.or();
                queryWrapper.in("house_id", houseList);
            }
        }

        Page<Maintain> maintainPage = maintainService.findAll(page, queryWrapper);
        for (Maintain maintain : maintainPage.getRecords()) {
            House house = houseService.get(maintain.getHouseId());
            User user = userService.get(maintain.getUserId());
            maintain.setUser(user == null ? new User() : user);
            maintain.setHouse(house == null ? new House() : house);
        }
        model.addAttribute("pageInfo", maintainPage);

        model.addAttribute("tab", "maintain-list");
        model.addAttribute("pagePrefix", "/admin/maintain?");
        model.addAttribute("isCustomer", loginUserIsCustomer());
        return "admin/maintain-list";
    }


    /**
     * 发布/编辑报修信息
     *
     * @param model
     * @return
     */
    @RequestMapping("/admin/maintain/publish")
    public String publish(@RequestParam(value = "id", required = false) Long id,
                          @RequestParam("houseId") Long houseId, Model model) {
        Maintain maintain;
        if (id != null) {
            // 如果要编辑的报修不存在，则跳转404
            maintain = maintainService.get(id);
            if (maintain == null) {
                return this.renderNotFound();
            }
            // 如果编辑别人的报修，则跳转403
            if (!loginUserIsAdmin() && !Objects.equals(maintain.getUserId(), getLoginUserId())) {
                return this.renderNotAllowAccess();
            }
        } else {
            maintain = new Maintain();
        }

        maintain.setHouseId(houseId);
        model.addAttribute("maintain", maintain);
        model.addAttribute("tab", "maintain-list");
        return "admin/maintain-publish";
    }


    /**
     * 发布/编辑报修信息
     *
     * @param model
     * @return
     */
    @RequestMapping("/admin/maintain/detail/{id}")
    public String details(@PathVariable(value = "id") Long id, Model model) {
        Maintain maintain = maintainService.get(id);
        if (maintain == null) {
            return this.renderNotFound();
        }

        House house = houseService.get(maintain.getHouseId());
        if (house == null) {
            return this.renderNotFound();
        }
        if (!loginUserIsAdmin()
                && !Objects.equals(maintain.getUserId(), getLoginUserId())
                && !Objects.equals(house.getUserId(), getLoginUserId())) {
            return this.renderNotAllowAccess();
        }

        User user = userService.get(maintain.getUserId());
        maintain.setHouse(house);
        maintain.setUser(user == null ? new User() : user);
        if (StringUtils.isNotEmpty(maintain.getImgUrl())) {
            // 处理轮播图URL
            List<String> imgUrlList = JSON.parseArray(maintain.getImgUrl(), String.class);
            maintain.setImgUrlList(imgUrlList);
        } else {
            maintain.setImgUrlList(new ArrayList<>());
        }


        model.addAttribute("maintain", maintain);
        model.addAttribute("tab", "maintain-list");
        return "admin/maintain-detail";
    }


    /**
     * 发布报修提交
     *
     * @return
     */
    @RequestMapping(value = "/admin/maintain/publish/submit", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult publishSubmit(Maintain maintain,
                                    @RequestParam("key") String imgKey,
                                    HttpSession session) {
        try {

            // 设置轮播图第一张图片为缩略图
            List<String> imgUrlList = (List<String>) session.getAttribute(Constant.SESSION_IMG_PREFIX + imgKey);
            if (imgUrlList.size() == 0) {
                return JsonResult.error("please upload at least one image");
            }


            if (imgUrlList != null && imgUrlList.size() > 0) {
                maintain.setImgUrl(JSON.toJSONString(imgUrlList));
            }
            maintain.setCreateTime(new Date());
            maintain.setUserId(getLoginUserId());
            maintain.setStatus(0);
            maintainService.insertOrUpdate(maintain);
        } catch (Exception e) {
            e.printStackTrace();
            return JsonResult.error("publish failed, please fill in the complete information");
        }
        return JsonResult.success("publish success", maintain.getId());
    }


    /**
     * 删除报修
     *
     * @return
     */
    @RequestMapping(value = "/admin/maintain/delete", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult deleteMaintain(@RequestParam("id") Long id) {
        try {
            Maintain maintain = maintainService.get(id);
            if (maintain == null) {
                return JsonResult.error("maintain not found");
            }
            House house = houseService.get(maintain.getHouseId());
            if (house == null) {
                return JsonResult.error("house information not found");
            }

            if (!loginUserIsAdmin()
                    && !Objects.equals(maintain.getUserId(), getLoginUserId())
                    && !Objects.equals(house.getUserId(), getLoginUserId())
            ) {
                return JsonResult.error("no permission to delete");
            }
            maintainService.delete(id);
        } catch (Exception e) {
            e.printStackTrace();
            return JsonResult.error("delete maintain failed");
        }
        return JsonResult.success("delete maintain success");
    }


    /**
     * 处理报修
     *
     * @return
     */
    @RequestMapping(value = "/admin/maintain/finish", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult finishMaintain(@RequestParam("id") Long id) {
        try {
            Maintain maintain = maintainService.get(id);
            if (maintain == null) {
                return JsonResult.error("maintain not found");
            }
            maintain.setStatus(1);
            maintainService.update(maintain);
        } catch (Exception e) {
            e.printStackTrace();
            return JsonResult.error("finish maintain failed");
        }
        return JsonResult.success("finish maintain success");
    }

}
