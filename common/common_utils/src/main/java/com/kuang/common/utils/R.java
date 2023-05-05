package com.kuang.common.utils;

import lombok.Data;

import java.util.HashMap;
import java.util.Map;

/**
 * @Description: 统一返回的结果类
 * @Author: StarSea99
 * @Date: 2020-09-27 22:55
 */
@Data
public class R {

    /**
     * 是否成功
     */
    private Boolean success;

    /**
     * 返回码
     */
    private Integer code;

    /**
     * 返回消息
     */
    private String message;

    /**
     * 返回数据
     */
    private Map<String, Object> data = new HashMap<String, Object>();

    private R() {}

    /**
     * 执行成功
     * @return
     */
    public static R ok() {
        R r = new R();
        r.setSuccess(true);
        r.setCode(ResultCode.SUCCESS);
        r.setMessage("执行成功");
        return r;
    }

    /**
     * 执行失败
     * @return
     */
    public static R error() {
        R r = new R();
        r.setSuccess(false);
        r.setCode(ResultCode.ERROR);
        r.setMessage("执行失败！");
        return r;
    }

    /**
     * 设置是否成功
     * @param success
     * @return
     */
    public R success(Boolean success){
        this.setSuccess(success);
        return this;
    }

    /**
     * 设置返回消息
     * @param message
     * @return
     */
    public R message(String message){
        this.setMessage(message);
        return this;
    }

    /**
     * 设置状态码
     * @param code
     * @return
     */
    public R code(Integer code){
        this.setCode(code);
        return this;
    }

    /**
     * 设置返回数据
     * @param key
     * @param value
     * @return
     */
    public R data(String key, Object value){
        this.data.put(key, value);
        return this;
    }

    /**
     * 设置返回数据
     * @param map
     * @return
     */
    public R data(Map<String, Object> map){
        this.setData(map);
        return this;
    }
}
