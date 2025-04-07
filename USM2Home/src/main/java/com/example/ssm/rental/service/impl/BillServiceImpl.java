package com.example.ssm.rental.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.ssm.rental.entity.Bill;
import com.example.ssm.rental.mapper.BillMapper;
import com.example.ssm.rental.service.BillService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;



@Service
public class BillServiceImpl implements BillService {

    @Autowired
    private BillMapper billMapper;

    @Override
    public BaseMapper<Bill> getRepository() {
        return billMapper;
    }

    @Override
    public QueryWrapper<Bill> getQueryWrapper(Bill bill) {
        QueryWrapper queryWrapper = new QueryWrapper();
        if (bill.getStatus() != null && bill.getStatus() != -1) {
            queryWrapper.eq("status", bill.getStatus());
        }
        if (bill.getOwnerUserId() != null && bill.getOwnerUserId() != -1) {
            queryWrapper.eq("owner_user_id", bill.getOwnerUserId());
        }
        if (bill.getCustomerUserId() != null && bill.getCustomerUserId() != -1) {
            queryWrapper.eq("customer_user_id", bill.getCustomerUserId());
        }

        return queryWrapper;
    }

    @Override
    public QueryWrapper<Bill> getQueryWrapper(Map<String, Object> condition) {
        return null;
    }

    @Override
    public List<Bill> getNotPayBillList(Long orderId) {
        Map<String, Object> map = new HashMap<>();
        map.put("order_id", orderId);
        map.put("status", 0);
        return billMapper.selectByMap(map);
    }
}
