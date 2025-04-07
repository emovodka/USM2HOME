package com.example.ssm.rental.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.ssm.rental.common.enums.OrderStatusEnum;
import com.example.ssm.rental.entity.Order;
import com.example.ssm.rental.mapper.OrderMapper;
import com.example.ssm.rental.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;



@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderMapper orderMapper;

    @Override
    public BaseMapper<Order> getRepository() {
        return orderMapper;
    }

    @Override
    public QueryWrapper<Order> getQueryWrapper(Order order) {
        QueryWrapper<Order> queryWrapper = new QueryWrapper();
        if (order != null) {
            if (order.getOwnerUserId() != null) {
                queryWrapper.eq("owner_user_id", order.getOwnerUserId());
            }
            if (order.getCustomerUserId() != null) {
                queryWrapper.eq("customer_user_id", order.getCustomerUserId());
            }
            if (order.getStatus() != null) {
                queryWrapper.eq("status", order.getStatus());
            }
            if (order.getStatusList() != null && order.getStatusList().size() > 0) {
                queryWrapper.in("status", order.getStatusList());
            }
        }
        return queryWrapper;
    }

    @Override
    public QueryWrapper<Order> getQueryWrapper(Map<String, Object> condition) {
        return null;
    }

    @Override
    public Order getCurrentEffectiveOrder(Long houseId) {
        QueryWrapper queryWrapper = new QueryWrapper();
        queryWrapper.eq("house_id", houseId);
        queryWrapper.eq("status", OrderStatusEnum.NORMAL.getValue());
        return orderMapper.selectOne(queryWrapper);
    }

    @Override
    public List<Order> findOverDueOrderList() {
        return orderMapper.findOverDueOrderList();
    }
}
