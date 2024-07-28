package com.javaclimb.houserent.common.enums;

/**
 * 订单状态枚举
 */
public enum OrderStatusEnum {
    /**
     * 订单状态： -3租客已取消 -2待签合同 -1待付款 0生效中 1已到期 2退租申请 3退租申请不通过
     */

    /*生效中*/
    NORMAL(0),

    /*已到期*/
    FINISH(1),

    /*退租申请*/
    END_APPLY(2),

    /*退租申请不通过*/
    END_APPLY_REJECT(3),

    /*-1待付款*/
    NOT_PAY(-1),

    /*-2待签合同*/
    NOT_AGREEMENT(-2),

    /*-3租客已取消*/
    CUSTOMER_CANCEL(-3)
    ;

    private Integer value;

    OrderStatusEnum(Integer value) {
        this.value = value;
    }

    public Integer getValue() {
        return value;
    }

    public void setValue(Integer value) {
        this.value = value;
    }
}
