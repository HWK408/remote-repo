package com.javaclimb.houserent.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.javaclimb.houserent.common.base.BaseEntity;
import lombok.Data;

/**
 * 收藏
 */
@Data
@TableName("t_mark")
public class Mark extends BaseEntity {
    /**
     * 收藏者id
     */
    private Long userId;

    /**
     * 房子id
     */
    private Long houseId;

    /**
     * 房子信息
     */
    @TableField(exist = false)
    private House house;
}
