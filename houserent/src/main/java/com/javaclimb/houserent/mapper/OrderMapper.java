package com.javaclimb.houserent.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.javaclimb.houserent.entity.Order;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * 订单mapper
 */
@Mapper
public interface OrderMapper extends BaseMapper<Order> {
    /**
     * 查询到期的订单
     */
    @Select("select * from t_order where status = 0 and end_date<now()")
    List<Order> findOverDueOrderList();
}
