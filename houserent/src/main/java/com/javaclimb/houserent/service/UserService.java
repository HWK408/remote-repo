package com.javaclimb.houserent.service;

import com.javaclimb.houserent.common.base.BaseService;
import com.javaclimb.houserent.entity.User;

/**
 * 用户服务接口
 */
public interface UserService extends BaseService<User,Long> {
    /**
     * 根据用户名查询用户
     */
    public User findByUserName(String userName);
}
