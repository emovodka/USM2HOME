package com.example.ssm.rental.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.ssm.rental.entity.Post;
import com.example.ssm.rental.mapper.CommentMapper;
import com.example.ssm.rental.mapper.PostMapper;
import com.example.ssm.rental.service.PostService;
import com.example.ssm.rental.common.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.Map;


@Service
public class PostServiceImpl implements PostService {

    @Autowired
    private PostMapper postMapper;

    @Autowired
    private CommentMapper commentMapper;

    @Override
    public BaseMapper<Post> getRepository() {
        return postMapper;
    }

    @Override
    public QueryWrapper<Post> getQueryWrapper(Post post) {
        QueryWrapper queryWrapper = new QueryWrapper();
        if(post.getUserId() != null) {
            queryWrapper.eq("user_id", post.getUserId());
        }
        if(StringUtils.isNotEmpty(post.getPostType())) {
            queryWrapper.eq("post_type", post.getPostType());
        }
        return queryWrapper;
    }

    @Override
    public QueryWrapper<Post> getQueryWrapper(Map<String, Object> condition) {
        return null;
    }


    @Override
    @Transactional(rollbackFor = Exception.class)
    public void delete(Long id) {
        postMapper.deleteById(id);

        Map<String, Object> map = new HashMap<>();
        map.put("user_id", id);

        Map<String, Object> map2 = new HashMap<>();
        map2.put("post_user_id", id);
        // 删除评论
        commentMapper.deleteByMap(map);
        commentMapper.deleteByMap(map2);
    }
}
