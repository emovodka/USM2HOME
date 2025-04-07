package com.example.ssm.rental.common.enums;



public enum PostTypeEnum {
    /**
     * 求租
     */
    QIU_ZU("qiu_zu"),



    ;

    private String value;

    PostTypeEnum(String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }
}
