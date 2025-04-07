package com.example.ssm.rental.common.enums;

public enum MessageStatusEnum {


    NOT_READ_MESSAGE(1, "unread"),
    HAD_READ_MESSAGE(2, "read"),
    DELETE_MESSAGE(3, "deleted");


    private Integer code;

    private String msg;

    MessageStatusEnum(Integer code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}
