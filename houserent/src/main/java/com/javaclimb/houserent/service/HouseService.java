package com.javaclimb.houserent.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.javaclimb.houserent.common.base.BaseService;
import com.javaclimb.houserent.common.vo.HouseSearchVO;
import com.javaclimb.houserent.entity.House;

import java.util.List;

/**
 * 房子服务接口
 */
public interface HouseService extends BaseService<House,Long> {
    /**
     * 根据用户id和房产证编号查询合租房子
     */
    List<House> findByUserIdAndCetificateNoAndRentType(Long userId,String cetificateNo,String rentType);

    /**
     * 根据出租类型获取最新的n条房子信息
     */
    public List<House> findTopList(String rentType,Integer limit);

    /**
     * 获得房子分页数据
     */
    Page<House> getHousePage(HouseSearchVO houseSearchVO,Page<House> page);
}
