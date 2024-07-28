package com.javaclimb.houserent.service;

import com.javaclimb.houserent.common.base.BaseService;
import com.javaclimb.houserent.entity.Mark;

import java.util.List;

/**
 * 收藏Service接口
 */
public interface MarkService extends BaseService<Mark,Long> {

    /**
     * 根据用户id和房子id查询该用户是否已经收藏过该房子
     */
    List<Mark> findByUserIdAndHouseId(Long userId,Long houseId);
}
