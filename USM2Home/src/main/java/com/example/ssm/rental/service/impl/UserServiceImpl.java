package com.example.ssm.rental.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.ssm.rental.entity.User;
import com.example.ssm.rental.mapper.*;
import com.example.ssm.rental.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;



@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private OrderMapper orderMapper;

    @Autowired
    private CommentMapper commentMapper;

    @Autowired
    private MarkMapper markMapper;

    @Autowired
    private FeedbackMapper feedbackMapper;

    @Autowired
    private HouseMapper houseMapper;

    @Autowired
    private BillMapper billMapper;

    @Autowired
    private MaintainMapper maintainMapper;

    @Override
    public BaseMapper<User> getRepository() {
        return userMapper;
    }

    @Override
    public QueryWrapper<User> getQueryWrapper(User user) {
        return null;
    }

    @Override
    public QueryWrapper<User> getQueryWrapper(Map<String, Object> condition) {
        return null;
    }

    @Override
    public User findByUserName(String userName) {
        QueryWrapper queryWrapper = new QueryWrapper();
        queryWrapper.eq("user_name", userName);


        return userMapper.selectOne(queryWrapper);
    }

    @Override
    public void delete(Long id) {
        try {
            // 删除用户
            userMapper.deleteById(id);
            Map<String, Object> map = new HashMap<>();
            map.put("user_id", id);
            Map<String, Object> map2 = new HashMap<>();
            map2.put("post_user_id", id);
            Map<String, Object> map3 = new HashMap<>();
            map3.put("owner_user_id", id);
            Map<String, Object> map4 = new HashMap<>();
            map4.put("customer_user_id", id);
            // 删除订单
            orderMapper.deleteByMap(map3);
            orderMapper.deleteByMap(map4);
            // 删除评论
            commentMapper.deleteByMap(map);
            commentMapper.deleteByMap(map2);
            // 删除收藏
            markMapper.deleteByMap(map);
            // 删除反馈
            feedbackMapper.deleteByMap(map);
            // 删除房子
            houseMapper.deleteByMap(map);
            // 删除账单
            billMapper.deleteByMap(map3);
            billMapper.deleteByMap(map4);
            // 删除报修
            maintainMapper.deleteByMap(map);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
