package com.javaclimb.houserent.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.javaclimb.houserent.common.enums.OrderStatusEnum;
import com.javaclimb.houserent.entity.Order;
import com.javaclimb.houserent.mapper.OrderMapper;
import com.javaclimb.houserent.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * 订单服务实现类
 */
@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderMapper orderMapper;

    /**
     * mapper对象
     */
    @Override
    public BaseMapper<Order> getRepository() {
        return orderMapper;
    }

    /**
     * 获得查询器
     *
     * @param order
     */
    @Override
    public QueryWrapper<Order> getQueryWrapper(Order order) {
        return null;
    }

    /**
     * 获得带参数的查询器
     *
     * @param condition
     */
    @Override
    public QueryWrapper<Order> getQueryWrapper(Map<String, Object> condition) {
        return null;
    }

    /**
     * 查询当前有效订单
     *
     * @param houseId
     */
    @Override
    public Order getCurrentEffectiveOrder(Long houseId) {
        QueryWrapper queryWrapper = new QueryWrapper();
        queryWrapper.eq("house_id",houseId);
        queryWrapper.eq("status", OrderStatusEnum.NORMAL);
        return orderMapper.selectOne(queryWrapper);
    }

    /**
     * 查询到期的订单
     */
    @Override
    public List<Order> findOverDueOrderList() {
        return orderMapper.findOverDueOrderList();
    }
}
