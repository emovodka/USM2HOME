package com.example.ssm.rental.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.ssm.rental.entity.Comment;
import org.apache.ibatis.annotations.Mapper;

/**
 * 评论数据访问层
 *
 * @author example
 */
@Mapper
public interface CommentMapper extends BaseMapper<Comment> {


}
