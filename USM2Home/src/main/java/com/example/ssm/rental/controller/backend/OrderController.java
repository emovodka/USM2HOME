package com.example.ssm.rental.controller.backend;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.ssm.rental.common.base.BaseController;
import com.example.ssm.rental.common.dto.JsonResult;
import com.example.ssm.rental.common.enums.HouseStatusEnum;
import com.example.ssm.rental.common.enums.OrderStatusEnum;
import com.example.ssm.rental.common.util.DateUtil;
import com.example.ssm.rental.common.util.PageUtil;
import com.example.ssm.rental.common.util.StringUtils;
import com.example.ssm.rental.entity.Bill;
import com.example.ssm.rental.entity.House;
import com.example.ssm.rental.entity.Order;
import com.example.ssm.rental.service.BillService;
import com.example.ssm.rental.service.HouseService;
import com.example.ssm.rental.service.OrderService;
import com.example.ssm.rental.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.List;
import java.util.Objects;

/**
 * 反馈控制器
 */
@Controller("backOrderController")
public class OrderController extends BaseController {

    @Autowired
    private OrderService orderService;

    @Autowired
    private HouseService houseService;

    @Autowired
    private UserService userService;

    @Autowired
    private BillService billService;


    /**
     * 订单列表
     *
     * @param model
     * @return
     */
    @RequestMapping("/admin/order")
    public String allOrder(@RequestParam(value = "page", defaultValue = "1") Integer pageNumber,
                           @RequestParam(value = "size", defaultValue = "6") Integer pageSize,
                           @RequestParam(value = "status", defaultValue = "") String status,
                           Model model) {
        Page page = PageUtil.initMpPage(pageNumber, pageSize);
        Order condition = new Order();
        // 如果登录用户是租客，查询该租客的订单
        if (loginUserIsCustomer()) {
            condition.setCustomerUserId(getLoginUserId());
        }
        // 如果登录用户是房东，查询该房东的订单
        else if (loginUserIsOwner()) {
            condition.setOwnerUserId(getLoginUserId());
        }
        if (StringUtils.isNotEmpty(status)) {
            condition.setStatus(Integer.valueOf(status));
        }
        //否则，管理员，查询所有的订单
        Page<Order> orderPage = orderService.findAll(page, condition);
        for (Order order : orderPage.getRecords()) {
            // 封装订单的，房屋信息、租客用户信息和房东信息
            // TODO 这个地方性能可以优化
            order.setHouse(houseService.get(order.getHouseId()));
            order.setOwnerUser(userService.get(order.getOwnerUserId()));
            order.setCustomerUser(userService.get(order.getCustomerUserId()));
        }
        model.addAttribute("pageInfo", orderPage);

        model.addAttribute("tab", "order-list");
        model.addAttribute("pagePrefix", "/admin/order?status=" + status);
        model.addAttribute("status", status);
        return "admin/order-list";
    }



    /**
     * 取消订单
     *
     * @param orderId
     * @return
     */
    @RequestMapping(value = "/admin/order/cancel", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult cancelOrder(@RequestParam("orderId") Long orderId) {
        // 校验
        Order order = orderService.get(orderId);
        if (order == null) {
            return JsonResult.error("order not found");
        }
        // 登录用户不是该订单的租客，不是房东，不是管理员，就不能取消订单
        Long loginUserId = getLoginUserId();
        if (!Objects.equals(loginUserId, order.getCustomerUserId()) &&
                !Objects.equals(loginUserId, order.getOwnerUserId()) &&
                !loginUserIsAdmin()) {
            return JsonResult.error("no permission");
        }
        order.setStatus(OrderStatusEnum.CUSTOMER_CANCEL.getValue());
        orderService.update(order);
        return JsonResult.success("cancel success");
    }


    /**
     * 提前退租申请
     *
     * @param orderId
     * @return
     */
    @RequestMapping(value = "/admin/order/end", method = RequestMethod.POST)
    @ResponseBody
    @Transactional(rollbackFor = Exception.class)
    public JsonResult endOrder(@RequestParam("orderId") Long orderId) {
        // 校验
        Order order = orderService.get(orderId);
        if (order == null) {
            return JsonResult.error("order not found");
        }
        // 登录用户不是该订单的租客，不是房东，不是管理员，不能提前退租
        Long loginUserId = getLoginUserId();
        if (!Objects.equals(loginUserId, order.getCustomerUserId()) &&
                !Objects.equals(loginUserId, order.getOwnerUserId())) {
            return JsonResult.error("no permission");
        }
        List<Bill> notPayBillList = billService.getNotPayBillList(orderId);
        if (notPayBillList.size() > 0) {
            return JsonResult.error("tenant has unpaid bills, cannot apply for early termination");
        }
        // 更新状态
        order.setStatus(OrderStatusEnum.END_APPLY.getValue());
        orderService.update(order);
        return JsonResult.success("rental termination has been applied, please contact the landlord for approval");
    }


    /**
     * 提前退租申请
     *
     * @param orderId
     * @return
     */
    @RequestMapping(value = "/admin/order/endPass", method = RequestMethod.POST)
    @ResponseBody
    @Transactional(rollbackFor = Exception.class)
    public JsonResult endPass(@RequestParam("orderId") Long orderId) {
        // 校验
        Order order = orderService.get(orderId);
        if (order == null) {
            return JsonResult.error("order not found");
        }
        // 只有房东和管理员可以操作
        Long loginUserId = getLoginUserId();
        if (!Objects.equals(loginUserId, order.getOwnerUserId()) &&
                !loginUserIsAdmin()) {
            return JsonResult.error("no permission");
        }

        List<Bill> notPayBillList = billService.getNotPayBillList(orderId);
        if (notPayBillList.size() > 0) {
            return JsonResult.error("tenant has unpaid bills, cannot apply for early termination");
        }

        // 更新订单金额、天数、状态
        order.setStatus(OrderStatusEnum.FINISH.getValue());
        Date toDay = new Date();
        int dayNum = DateUtil.daysBetween(order.getStartDate(), toDay);
        order.setDayNum(dayNum);
        order.setTotalAmount(order.getMonthRent() / 30 * dayNum);
        order.setEndDate(toDay);
        orderService.update(order);

        // 暂不考虑退租退钱的场景

        // 重置房子状态为未租出
        House house = houseService.get(order.getHouseId());
        if (house != null && Objects.equals(house.getStatus(), HouseStatusEnum.HAS_RENT.getValue())) {
            house.setStatus(HouseStatusEnum.NOT_RENT.getValue());
            house.setLastOrderEndTime(new Date());
            houseService.update(house);
        }
        return JsonResult.success("rental termination success");
    }


    /**
     * 提前退租申请拒绝
     *
     * @param orderId
     * @return
     */
    @RequestMapping(value = "/admin/order/endReject", method = RequestMethod.POST)
    @ResponseBody
    @Transactional(rollbackFor = Exception.class)
    public JsonResult endReject(@RequestParam("orderId") Long orderId) {
        // 校验
        Order order = orderService.get(orderId);
        if (order == null) {
            return JsonResult.error("order not found");
        }
        // 只有房东和管理员可以操作
        Long loginUserId = getLoginUserId();
        if (!Objects.equals(loginUserId, order.getOwnerUserId()) &&
                !loginUserIsAdmin()) {
            return JsonResult.error("no permission");
        }

        order.setStatus(OrderStatusEnum.END_APPLY_REJECT.getValue());
        orderService.update(order);

        return JsonResult.success("operation success");
    }

    /**
     * 删除订单
     *
     * @param orderId
     * @return
     */
    @RequestMapping(value = "/admin/order/delete", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult deleteOrder(@RequestParam("orderId") Long orderId) {
        // 校验
        Order order = orderService.get(orderId);
        if (order == null) {
            return JsonResult.error("order not found");
        }
        // 只有管理员和房东可以删除订单
        Long loginUserId = getLoginUserId();
        if (!loginUserIsAdmin() && !Objects.equals(loginUserId, order.getOwnerUserId())) {
            return JsonResult.error("no permission to delete this order");
        }
        
        // 删除订单
        orderService.delete(orderId);
        return JsonResult.success("order deleted successfully");
    }

}
