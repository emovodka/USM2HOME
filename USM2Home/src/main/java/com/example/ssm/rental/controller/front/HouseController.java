package com.example.ssm.rental.controller.front;

import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.ssm.rental.common.base.BaseController;
import com.example.ssm.rental.common.dto.JsonResult;
import com.example.ssm.rental.common.enums.HouseRentTypeEnum;
import com.example.ssm.rental.common.util.MailUtil;
import com.example.ssm.rental.common.util.PageUtil;
import com.example.ssm.rental.common.vo.HouseSearchVO;
import com.example.ssm.rental.entity.House;
import com.example.ssm.rental.entity.Order;
import com.example.ssm.rental.entity.User;
import com.example.ssm.rental.service.HouseService;
import com.example.ssm.rental.service.OrderService;
import com.example.ssm.rental.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * 前台房子信息控制器
 *
 */
@Controller
public class HouseController extends BaseController {

    @Autowired
    private HouseService houseService;

    @Autowired
    private UserService userService;

    @Autowired
    private OrderService orderService;

    /**
     * 房子列表
     * 根据关键字搜索
     * 查询整租/合租
     *
     * @param houseSearchVO 搜索封装参数对象
     * @param model         model，给jsp页码传值
     * @return 前端文件位置
     */
    @RequestMapping("/house")
    public String houseList(HouseSearchVO houseSearchVO, Model model) {
        Page page = PageUtil.initMpPage(houseSearchVO.getPage(), houseSearchVO.getSize());

        // 查询房子信息
        Page<House> housePage = houseService.getHousePage(houseSearchVO, page);
        model.addAttribute("pageInfo", housePage);

        model.addAttribute("houseSearchVO", houseSearchVO);
        model.addAttribute("pagePrefix", houseSearchVO.getPagePrefix());

        return "front/house-list";
    }


    /**
     * 房子详情
     *
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("/house/detail/{id}")
    public String search(@PathVariable("id") Long id, Model model) {
        // 查询房子
        House house = houseService.get(id);
        if (house == null) {
            return this.renderNotFound();
        }

        // 处理轮播图URL
        List<String> slideList = JSON.parseArray(house.getSlideUrl(), String.class);
        house.setSlideImgList(slideList);

        // 查询房子的出租者
        User owner = userService.get(house.getUserId());
        model.addAttribute("owner", owner);

        // 如果是合租，查询合租房子
        List<House> shareHouseList = houseService.findByUserIdAndCertificateNoAndRentType(house.getUserId(), house.getCertificateNo(), HouseRentTypeEnum.SHARE.getValue());
        for (House houseTemp : shareHouseList) {
            Order currentOrder = orderService.getCurrentEffectiveOrder(houseTemp.getId());
            if (currentOrder != null) {
                currentOrder.setCustomerUser(userService.get(currentOrder.getCustomerUserId()));
            }
            houseTemp.setCurrentOrder(currentOrder);
        }
        house.setShareHouseList(shareHouseList);
        model.addAttribute("house", house);

        model.addAttribute("isCustomer", loginUserIsCustomer());
        return "front/house-detail";
    }

    /**
     * 房子地图页面
     *
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("/house/map")
    public String map(@RequestParam("id") Long id, Model model) {
        House house = houseService.get(id);
        if (house == null) {
            return this.renderNotFound();
        }
        String longitudeLatitude = house.getLongitudeLatitude();
        String[] arr = longitudeLatitude.split(",");
        if (arr.length == 2) {
            model.addAttribute("longitude", arr[0]);
            model.addAttribute("latitude", arr[1]);
        }
        model.addAttribute("address", house.getAddress());
        model.addAttribute("title", house.getTitle());
        return "front/house-map";
    }


    /**
     * 联系房东
     *
     * @param session
     * @return
     */
    @RequestMapping("/house/contact")
    @ResponseBody
    public JsonResult contact(@RequestParam("houseId") Long houseId,
                              @RequestParam("name") String name,
                              @RequestParam("phone") String phone,
                              @RequestParam("email") String email,
                              @RequestParam("content") String content, HttpSession session) {
        User user = getLoginUser();
        if (user == null) {
            return JsonResult.error("please login first");
        }
        House house = houseService.get(houseId);
        if (house == null) {
            return JsonResult.error("house not found");
        }
        User owner = userService.get(house.getUserId());
        if (owner == null) {
            return JsonResult.error("landlord not found");
        }
        String ownerEmail = owner.getEmail();

        try {
            StringBuilder sb = new StringBuilder();
            sb.append("name: ").append(name).append("<br/>");
            sb.append("phone: ").append(phone).append("<br/>");
            sb.append("email: ").append(email).append("<br/>");
            sb.append("content: ").append(content).append("<br/>");
            sb.append("link(copy and paste in the address bar) ：").append("http://localhost:8080/house/detail/").append(houseId);
            MailUtil.sendMail(ownerEmail, "From " + name + " about renting a house", sb.toString());
        } catch (MessagingException e) {
            e.printStackTrace();
            return JsonResult.error("email sending failed");
        }
        return JsonResult.success("email sent successfully");
    }

    @RequestMapping("/community")
    public String communityDetail(@RequestParam("name") String communityName, Model model) {
        model.addAttribute("communityName", communityName);
        // 这里可以后续补充小区介绍和房源列表
        return "front/community-detail";
    }

}
