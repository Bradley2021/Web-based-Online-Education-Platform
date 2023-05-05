package com.kuang.common.utils;

/**
 * @Description: 状态码类
 * @Author: StarSea99
 * @Date: 2020-09-27 22:53
 */
public interface ResultCode {
    /**
     * 操作成功
     */
    public static Integer SUCCESS = 20000;

    /**
     * 操作失败
     */
    public static Integer ERROR = 20001;

    /**
     * 未授权
     */
    public static final int UNAUTHORIZED = 401;

    /**
     * 访问受限，授权过期
     */
    public static final int FORBIDDEN = 403;
}
