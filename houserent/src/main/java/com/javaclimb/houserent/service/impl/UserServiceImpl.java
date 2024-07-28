package com.javaclimb.houserent.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.javaclimb.houserent.entity.User;
import com.javaclimb.houserent.mapper.UserMapper;
import com.javaclimb.houserent.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * 用户服务接口实现
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    /**
     * mapper对象
     */
    @Override
    public BaseMapper<User> getRepository() {
        return userMapper;
    }

    /**
     * 获得查询器
     *
     * @param user
     */
    @Override
    public QueryWrapper<User> getQueryWrapper(User user) {
        return null;
    }

    /**
     * 获得带参数的查询器
     *
     * @param condition
     */
    @Override
    public QueryWrapper<User> getQueryWrapper(Map<String, Object> condition) {
        return null;
    }

    /**
     * 根据用户名查询用户
     */
    @Override
    public User findByUserName(String userName) {
        QueryWrapper queryWrapper = new QueryWrapper();
        queryWrapper.eq("user_name",userName);
        return userMapper.selectOne(queryWrapper);
    }
}
