package com.example.ssm.rental.controller.backend;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.ssm.rental.common.base.BaseController;
import com.example.ssm.rental.common.dto.JsonResult;
import com.example.ssm.rental.common.util.PageUtil;
import com.example.ssm.rental.entity.Bill;
import com.example.ssm.rental.entity.House;
import com.example.ssm.rental.entity.Order;
import com.example.ssm.rental.service.BillService;
import com.example.ssm.rental.service.HouseService;
import com.example.ssm.rental.service.OrderService;
import com.example.ssm.rental.service.UserService;
import com.example.ssm.rental.common.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Calendar;
import java.util.Date;
import java.util.Objects;

/**
 * 账单控制器
 *
 */
@Controller("backBillController")
public class BillController extends BaseController {

    @Autowired
    private BillService billService;

    @Autowired
    private HouseService houseService;

    @Autowired
    private UserService userService;

    @Autowired
    private OrderService orderService;


    /**
     * 账单列表
     *
     * @param model
     * @return
     */
    @RequestMapping("/admin/bill")
    public String allBill(@RequestParam(value = "page", defaultValue = "1") Integer pageNumber,
                          @RequestParam(value = "size", defaultValue = "10") Integer pageSize,
                          @RequestParam(value = "status", defaultValue = "") String status,
                          Model model) {
        Page page = PageUtil.initMpPage(pageNumber, pageSize);
        Bill condition = new Bill();
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
        Page<Bill> billPage = billService.findAll(page, condition);
        for (Bill bill : billPage.getRecords()) {
            // 封装订单的，房屋信息、租客用户信息和房东信息
            bill.setHouse(houseService.get(bill.getHouseId()));
            bill.setOwnerUser(userService.get(bill.getOwnerUserId()));
            bill.setCustomerUser(userService.get(bill.getCustomerUserId()));
        }
        model.addAttribute("pageInfo", billPage);

        model.addAttribute("tab", "bill-list");
        model.addAttribute("pagePrefix", "/admin/bill?status=" + status);
        model.addAttribute("status", status);
        model.addAttribute("isCustomer", loginUserIsCustomer());
        return "admin/bill-list";
    }

    /**
     * 支付账单
     *
     * @return
     */
    @RequestMapping(value = "/admin/bill/pay", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult finishBill(@RequestParam("id") Long id) {
        try {
            Bill bill = billService.get(id);
            if (bill == null) {
                return JsonResult.error("bill not found");
            }
            bill.setStatus(1);
            billService.update(bill);
        } catch (Exception e) {
            e.printStackTrace();
            return JsonResult.error("pay bill failed");
        }
        return JsonResult.success("pay bill success");
    }

    /**
     * 创建账单
     *
     * @param model
     * @return
     */
    @RequestMapping("/admin/bill/publish")
    public String publish(
            @RequestParam("orderId") Long orderId, Model model) {

        Order order = orderService.get(orderId);
        if (order == null) {
            return this.renderNotFound();
        }

        Bill bill = new Bill();
        bill.setOrderId(order.getId());
        bill.setHouseId(order.getHouseId());
        bill.setOwnerUserId(order.getOwnerUserId());
        bill.setCustomerUserId(order.getCustomerUserId());

        Calendar cal = Calendar.getInstance();
        int month = cal.get(Calendar.MONTH) + 1;
        bill.setTitle(month + " monthly water and electricity bill");
        model.addAttribute("bill", bill);
        model.addAttribute("tab", "bill-list");
        return "admin/bill-publish";
    }


    /**
     * 发布订单提交
     *
     * @return
     */
    @RequestMapping(value = "/admin/bill/publish/submit", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult publishSubmit(Bill bill) {
        try {

            bill.setCreateTime(new Date());
            bill.setStatus(0);
            billService.insertOrUpdate(bill);
        } catch (Exception e) {
            e.printStackTrace();
            return JsonResult.error("create failed");
        }
        return JsonResult.success("create success", bill.getId());
    }


    /**
     * 删除账单
     *
     * @return
     */
    @RequestMapping(value = "/admin/bill/delete", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult deleteBill(@RequestParam("id") Long id) {
        try {
            Bill bill = billService.get(id);
            if (bill == null) {
                return JsonResult.error("bill not found");
            }

            if (!loginUserIsAdmin() && !Objects.equals(bill.getOwnerUserId(), getLoginUserId())) {
                return JsonResult.error("no permission to delete");
            }
            billService.delete(id);
        } catch (Exception e) {
            e.printStackTrace();
            return JsonResult.error("delete bill failed");
        }
        return JsonResult.success("delete bill success");
    }

    /**
     * 支付页面
     *
     * @param billId
     * @return
     */
    @RequestMapping(value = "/admin/bill/pay", method = RequestMethod.GET)
    public String pay(@RequestParam(value = "billId") Long billId,
                      Model model) {

        Bill bill = billService.get(billId);
        if (bill == null) {
            return this.renderNotFound();
        }
        // 登录用户不是该订单的租客，不是房东，不是管理员，就不能支付
        Long loginUserId = getLoginUserId();
        if (!Objects.equals(loginUserId, bill.getCustomerUserId()) &&
                !Objects.equals(loginUserId, bill.getOwnerUserId()) &&
                !loginUserIsAdmin()) {
            return this.renderNotAllowAccess();
        }

        model.addAttribute("bill", bill);
        return "admin/bill-pay";
    }

}
