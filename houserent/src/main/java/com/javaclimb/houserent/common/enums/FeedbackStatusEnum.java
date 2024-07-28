package com.javaclimb.houserent.common.enums;

/**
 * 反馈状态
 */
public enum FeedbackStatusEnum {
    /**
     * 状态：0未处理 1已处理
     */

    /*未处理*/
    NOT_HANDLE(0),

    /*已处理*/
    HAS_HANDLE(1)
    ;

    private Integer value;

    FeedbackStatusEnum(Integer value) {
        this.value = value;
    }

    public Integer getValue() {
        return value;
    }

    public void setValue(Integer value) {
        this.value = value;
    }
}
