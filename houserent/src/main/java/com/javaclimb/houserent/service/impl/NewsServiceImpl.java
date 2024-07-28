package com.javaclimb.houserent.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.javaclimb.houserent.entity.News;
import com.javaclimb.houserent.mapper.NewsMapper;
import com.javaclimb.houserent.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * 新闻资讯service实现类
 */
@Service
public class NewsServiceImpl implements NewsService {

    @Autowired
    private NewsMapper newsMapper;

    /**
     * mapper对象
     */
    @Override
    public BaseMapper<News> getRepository() {
        return newsMapper;
    }

    /**
     * 获得查询器
     *
     * @param news
     */
    @Override
    public QueryWrapper<News> getQueryWrapper(News news) {
        QueryWrapper<News> queryWrapper = new QueryWrapper<>();
        return queryWrapper;
    }

    /**
     * 获得带参数的查询器
     *
     * @param condition
     */
    @Override
    public QueryWrapper<News> getQueryWrapper(Map<String, Object> condition) {
        return null;
    }
}
