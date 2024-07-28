package com.javaclimb.houserent.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.javaclimb.houserent.entity.Feedback;
import com.javaclimb.houserent.mapper.FeedbackMapper;
import com.javaclimb.houserent.service.FeedbackService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * 用户反馈service实现类
 */
@Service
public class FeedbackServiceImpl implements FeedbackService {

    @Autowired
    private FeedbackMapper feedbackMapper;

    /**
     * mapper对象
     */
    @Override
    public BaseMapper<Feedback> getRepository() {
        return feedbackMapper;
    }

    /**
     * 获得查询器
     *
     * @param feedback
     */
    @Override
    public QueryWrapper<Feedback> getQueryWrapper(Feedback feedback) {
        QueryWrapper<Feedback> queryWrapper = new QueryWrapper<>();
        if(feedback!=null&&feedback.getUserId()!=null){
            queryWrapper.eq("user_id",feedback.getUserId());
        }
        return queryWrapper;
    }

    /**
     * 获得带参数的查询器
     *
     * @param condition
     */
    @Override
    public QueryWrapper<Feedback> getQueryWrapper(Map<String, Object> condition) {
        return null;
    }
}
