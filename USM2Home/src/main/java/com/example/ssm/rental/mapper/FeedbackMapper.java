package com.example.ssm.rental.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.ssm.rental.entity.Feedback;
import org.apache.ibatis.annotations.Mapper;

/**
 * 反馈mapper
 */
@Mapper
public interface FeedbackMapper extends BaseMapper<Feedback> {
}
