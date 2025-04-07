package com.example.ssm.rental.common.enums;

/**
 * 房子出租类型
 */

public enum HouseRentTypeEnum {
    /**
     * 整租
     */
    WHOLE("whole"),

    /**
     * 合租
     */
    SHARE("share"),


    ;

    private String value;

    HouseRentTypeEnum(String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }
}
