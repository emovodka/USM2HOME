package com.example.ssm.rental.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.ssm.rental.entity.Comment;
import com.example.ssm.rental.mapper.CommentMapper;
import com.example.ssm.rental.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;


@Service
public class CommentServiceImpl implements CommentService {

    @Autowired
    private CommentMapper commentMapper;

    @Override
    public BaseMapper<Comment> getRepository() {
        return commentMapper;
    }

    @Override
    public QueryWrapper<Comment> getQueryWrapper(Comment comment) {
        QueryWrapper queryWrapper = new QueryWrapper();
        if(comment.getUserId() != null) {
            queryWrapper.eq("user_id", comment.getUserId());
        }

        return queryWrapper;
    }

    @Override
    public QueryWrapper<Comment> getQueryWrapper(Map<String, Object> condition) {
        return null;
    }

}
