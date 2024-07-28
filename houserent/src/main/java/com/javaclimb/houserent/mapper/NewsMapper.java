package com.javaclimb.houserent.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.javaclimb.houserent.entity.News;
import org.apache.ibatis.annotations.Mapper;

/**
 * 新闻mapper
 */
@Mapper
public interface NewsMapper extends BaseMapper<News> {
}
