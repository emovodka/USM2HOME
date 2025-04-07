package com.example.ssm.rental.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.ssm.rental.entity.Post;
import org.apache.ibatis.annotations.Mapper;

/**
 * 文章数据访问层
 *
 */
@Mapper
public interface PostMapper extends BaseMapper<Post> {


}
