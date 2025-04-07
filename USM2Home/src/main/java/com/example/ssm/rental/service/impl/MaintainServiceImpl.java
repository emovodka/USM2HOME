package com.example.ssm.rental.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.ssm.rental.entity.Maintain;
import com.example.ssm.rental.mapper.MaintainMapper;
import com.example.ssm.rental.service.MaintainService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;



@Service
public class MaintainServiceImpl implements MaintainService {

    @Autowired
    private MaintainMapper maintainMapper;

    @Override
    public BaseMapper<Maintain> getRepository() {
        return maintainMapper;
    }

    @Override
    public QueryWrapper<Maintain> getQueryWrapper(Maintain maintain) {
        QueryWrapper queryWrapper = new QueryWrapper();
        if (maintain.getUserId() != null) {
            queryWrapper.eq("user_id", maintain.getUserId());
        }
        return queryWrapper;
    }

    @Override
    public QueryWrapper<Maintain> getQueryWrapper(Map<String, Object> condition) {
        return null;
    }
}
