package com.example.ssm.rental.common.dto;

import lombok.Data;

import java.io.Serializable;


@Data
public class QueryCondition<T> implements Serializable {

    /**
     * 根据字段筛选
     */
    private T data;


    public QueryCondition() {
    }

    public QueryCondition(T data) {
        this.data = data;
    }

}
