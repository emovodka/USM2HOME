package com.example.ssm.rental.service;

import com.example.ssm.rental.common.base.BaseService;
import com.example.ssm.rental.entity.Bill;

import java.util.List;


/**
 * 账单接口
 */

public interface BillService extends BaseService<Bill, Long> {

    /**
     * 查询未支付的账单
     * @param orderId
     * @return
     */
    List<Bill> getNotPayBillList(Long orderId);
}
