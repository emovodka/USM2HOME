package com.example.ssm.rental.controller.backend;

import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.ssm.rental.common.base.BaseController;
import com.example.ssm.rental.common.constant.Constant;
import com.example.ssm.rental.common.dto.JsonResult;
import com.example.ssm.rental.common.enums.HouseStatusEnum;
import com.example.ssm.rental.common.util.PageUtil;
import com.example.ssm.rental.common.util.StringUtils;
import com.example.ssm.rental.entity.House;
import com.example.ssm.rental.entity.User;
import com.example.ssm.rental.service.HouseService;
import com.example.ssm.rental.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;
import java.util.Objects;
import java.util.ArrayList;
import java.util.Map;
import java.util.HashMap;
import java.util.Arrays;

/**
 * 房子控制器
 */
@Controller("backHouseController")
public class HouseController extends BaseController {

    @Autowired
    private HouseService houseService;

    @Autowired
    private UserService userService;

    // 写死所有小区信息
    private static final Map<String, Map<String, Object>> COMMUNITY_DATA = new HashMap<>();
    static {
        Map<String, Object> plazaIvory = new HashMap<>();
        plazaIvory.put("info", "Plaza Ivory is a premium residential community offering modern luxury living in the heart of the city.");
        plazaIvory.put("address", "88 Ivory Boulevard, Central District");
        plazaIvory.put("year", "2020");
        plazaIvory.put("developer", "Ivory Estates Development Ltd.");
        plazaIvory.put("distance", "500m to USM, 200m to Metro Station");
        plazaIvory.put("images", Arrays.asList(
            "/assets/img/community/pi_1.jpeg",
            "/assets/img/community/pi_2.jpg",
            "/assets/img/community/pi_3.jpeg"
        ));
        COMMUNITY_DATA.put("Plaza Ivory", plazaIvory);

        Map<String, Object> ePark = new HashMap<>();
        ePark.put("info", "E-Park is a modern community with beautiful gardens and convenient facilities.");
        ePark.put("address", "123 E-Park Road, East District");
        ePark.put("year", "2018");
        ePark.put("developer", "E-Park Development Co.");
        ePark.put("distance", "800m to USM, 300m to Shopping Mall");
        ePark.put("images", Arrays.asList(
            "/assets/img/community/ep_1.png",
            "/assets/img/community/ep_2.jpeg"
        ));
        COMMUNITY_DATA.put("E-Park", ePark);

        // 你可以继续添加其它小区
    }

    /**
     * 房子管理
     *
     * @param model
     * @return
     */
    @RequestMapping("/admin/house")
    public String allHouse(@RequestParam(value = "page", defaultValue = "1") Integer pageNumber,
                           @RequestParam(value = "size", defaultValue = "6") Integer pageSize,
                           @RequestParam(value = "keywords", defaultValue = "") String keywords,
                           @RequestParam(value = "status", defaultValue = "") String status,
                           Model model) {
        Page page = PageUtil.initMpPage(pageNumber, pageSize);
        House condition = new House();
        // 如果登录用户不是管理员，查询该用户的房子，否则管理员查询所有的房子
        if (!loginUserIsAdmin()) {
            condition.setUserId(getLoginUserId());
        }
        if (StringUtils.isNotEmpty(keywords)) {
            condition.setTitle(keywords);
        }
        if (StringUtils.isNotEmpty(status)) {
            try {
                condition.setStatus(Integer.valueOf(status));
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        Page<House> housePage = houseService.findAll(page, condition);
        for (House item : housePage.getRecords()) {
            User user = userService.get(item.getUserId());
            item.setOwnerUser(user == null ? new User() : user);
        }
        model.addAttribute("pageInfo", housePage);

        model.addAttribute("tab", "house-list");
        model.addAttribute("pagePrefix", "/admin/house?status=" + status + "&keywords=" + keywords);

        model.addAttribute("isAdmin", loginUserIsAdmin());
        model.addAttribute("status", status);
        model.addAttribute("keywords", keywords);
        return "admin/house-list";
    }
    


    /**
     * 发布/编辑房子信息
     *
     * @param model
     * @return
     */
    @RequestMapping("/admin/house/publish")
    public String publish(@RequestParam(value = "id", required = false) Long id, Model model) {
        House house;
        if (id != null) {
            // 如果要编辑的房子不存在，则跳转404
            house = houseService.get(id);
            if (house == null) {
                return this.renderNotFound();
            }
            // 如果编辑别人的房子，则跳转403
            if (!loginUserIsAdmin() && !Objects.equals(house.getUserId(), getLoginUserId())) {
                return this.renderNotAllowAccess();
            }
        } else {
            house = new House();
        }
        model.addAttribute("house", house);
        model.addAttribute("tab", "house-publish");
        return "admin/house-publish";
    }



    /**
     * 发布房子提交
     *
     * @return
     */
    @RequestMapping(value = "/admin/house/publish/submit", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult publishSubmit(House house, @RequestParam("key") String imgKey, HttpSession session) {
        User user = userService.get(getLoginUserId());
        if (user != null && StringUtils.isEmpty(user.getIdCardImg())) {
            return JsonResult.error("please upload your real ID card photo in your personal information first");
        }

        if (loginUserIsAdmin()) {
            return JsonResult.error("admin cannot publish house information, please use the landlord account to publish");
        }

        try {
            // 发布房子，设置用户ID
            if (house.getId() == null) {
                house.setCreateTime(new Date());
                house.setUserId(getLoginUserId());
                // 设置默认城市为 Penang
                house.setCity("Penang");
            }

            // 设置轮播图第一张图片为缩略图
            List<String> imgUrlList = (List<String>) session.getAttribute(Constant.SESSION_IMG_PREFIX + imgKey);
            if (house.getId() == null && imgUrlList.size() == 0) {
                return JsonResult.error("please upload at least one house photo");
            }

            if (imgUrlList != null && imgUrlList.size() > 0) {
                house.setThumbnailUrl(imgUrlList.get(0));
                house.setSlideUrl(JSON.toJSONString(imgUrlList));
            }
            
            // 校验经纬度坐标
            if (house.getLongitudeLatitude() != null && !house.getLongitudeLatitude().contains(",")) {
                return JsonResult.error("please input a valid longitude and latitude coordinate");
            }

            house.setStatus(HouseStatusEnum.NOT_CHECK.getValue());
            houseService.insertOrUpdate(house);
        } catch (Exception e) {
            e.printStackTrace();
            return JsonResult.error("publish failed, please fill in the complete information");
        }
        return JsonResult.success("publish success", house.getId());
    }


    /**
     * 删除房子
     *
     * @return
     */
    @RequestMapping(value = "/admin/house/delete", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult deleteHouse(@RequestParam("id") Long id) {
        try {
            House house = houseService.get(id);
            if (house == null) {
                return JsonResult.error("house not found");
            }
            if (!loginUserIsAdmin() && !Objects.equals(house.getUserId(), getLoginUserId())) {
                return JsonResult.error("no permission to delete, this is not your house");
            }
            if (Objects.equals(house.getStatus(), HouseStatusEnum.HAS_RENT.getValue())) {
                return JsonResult.error("the house is being rented, cannot be deleted");
            }
            houseService.delete(id);
        } catch (Exception e) {
            e.printStackTrace();
            return JsonResult.error("delete house failed");
        }
        return JsonResult.success("delete house success");
    }

    
    /**
     * 上架房子
     * 正在租住的房子，不能手动上架，需要等时间到了，自动上架
     *
     * @return
     */
    @RequestMapping(value = "/admin/house/up", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult upHouse2(@RequestParam("id") Long id) {
        try {
            House house = houseService.get(id);
            if (house == null) {
                return JsonResult.error("house not found");
            }
            if (!loginUserIsAdmin() && !Objects.equals(house.getUserId(), getLoginUserId())) {
                return JsonResult.error("no permission to up, this is not your house");
            }
            if (Objects.equals(house.getStatus(), HouseStatusEnum.HAS_RENT.getValue())) {
                return JsonResult.error("the house is being rented, cannot be up");
            }
            house.setStatus(HouseStatusEnum.NOT_RENT.getValue());
            houseService.update(house);
        } catch (Exception e) {
            e.printStackTrace();
            return JsonResult.error("up house failed");
        }
        return JsonResult.success("up house success");
    }


    /**
     * 下架房子
     *
     * @return
     */
    @RequestMapping(value = "/admin/house/down", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult downHouse(@RequestParam("id") Long id) {
        try {
            House house = houseService.get(id);
            if (house == null) {
                return JsonResult.error("house not found");
            }
            if (!loginUserIsAdmin() && !Objects.equals(house.getUserId(), getLoginUserId())) {
                return JsonResult.error("no permission to down, this is not your house");
            }
            house.setStatus(HouseStatusEnum.HAS_DOWN.getValue());
            houseService.update(house);
        } catch (Exception e) {
            e.printStackTrace();
            return JsonResult.error("down house failed");
        }
        return JsonResult.success("down house success");
    }
    


    /**
     * 审核通过
     *
     * @return
     */
    @RequestMapping(value = "/admin/house/checkPass", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult checkPass(@RequestParam("id") Long id) {
        try {
            House house = houseService.get(id);
            if (house == null) {
                return JsonResult.error("house not found");
            }
            if (!loginUserIsAdmin()) {
                return JsonResult.error("no permission to check");
            }
            if (!Objects.equals(house.getStatus(), HouseStatusEnum.NOT_CHECK.getValue())) {
                return JsonResult.error("can only check houses that are waiting for review");
            }
            house.setStatus(HouseStatusEnum.NOT_RENT.getValue());
            houseService.update(house);
        } catch (Exception e) {
            e.printStackTrace();
            return JsonResult.error("check pass failed");
        }
        return JsonResult.success("check pass success");
    }


    /**
     * 审核不通过
     *
     * @return
     */
    @RequestMapping(value = "/admin/house/checkReject", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult checkReject(@RequestParam("id") Long id) {
        try {
            House house = houseService.get(id);
            if (house == null) {
                return JsonResult.error("house not found");
            }
            if (!loginUserIsAdmin()) {
                return JsonResult.error("no permission to check");
            }
            if (!Objects.equals(house.getStatus(), HouseStatusEnum.NOT_CHECK.getValue())) {
                return JsonResult.error("can only check houses that are waiting for review");
            }
            house.setStatus(HouseStatusEnum.CHECK_REJECT.getValue());
            houseService.update(house);
        } catch (Exception e) {
            e.printStackTrace();
            return JsonResult.error("check reject failed");
        }
        return JsonResult.success("check reject success");
    }

    @RequestMapping("/community")
    public String communityDetail(@RequestParam("name") String communityName, Model model) {
        model.addAttribute("communityName", communityName);

        Map<String, Object> data = COMMUNITY_DATA.get(communityName);
        if (data != null) {
            model.addAttribute("communityInfo", data.get("info"));
            model.addAttribute("communityAddress", data.get("address"));
            model.addAttribute("communityYear", data.get("year"));
            model.addAttribute("communityDeveloper", data.get("developer"));
            model.addAttribute("communityDistance", data.get("distance"));
            model.addAttribute("communityImages", data.get("images"));
        } else {
            // 没有找到小区，给默认值
            model.addAttribute("communityInfo", "No info available.");
            model.addAttribute("communityAddress", "Unknown");
            model.addAttribute("communityYear", "Unknown");
            model.addAttribute("communityDeveloper", "Unknown");
            model.addAttribute("communityDistance", "Unknown");
            model.addAttribute("communityImages", new ArrayList<>());
        }

        return "front/community-detail";
    }

}
