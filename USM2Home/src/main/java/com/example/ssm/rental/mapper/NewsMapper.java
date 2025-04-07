package com.example.ssm.rental.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.ssm.rental.entity.News;
import org.apache.ibatis.annotations.Mapper;

/**
 * 新闻mapper
 *
 */
@Mapper
public interface NewsMapper extends BaseMapper<News> {
}
