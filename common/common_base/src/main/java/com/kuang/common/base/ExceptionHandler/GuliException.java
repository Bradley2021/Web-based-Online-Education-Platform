package com.kuang.common.base.ExceptionHandler;

import com.kuang.common.utils.ResultCodeEnum;
import lombok.Data;

/**
 * @Description: 抛出异常处理类
 * @Author: StarSea99
 * @Date: 2020-09-28 18:05
 */
@Data
public class GuliException extends RuntimeException{

    /**
     * 错误码
     */
    private Integer code;

    /**
     * 错误消息
     */
    private String msg;

    /**
     * 通过状态码和错误消息创建异常对象
     * @param code
     * @param msg
     */
    public GuliException(Integer code, String msg) {
        super(msg);
        this.msg = msg;
        this.code = code;
    }

    /**
     * 接收枚举类型对象
     * @param resultCodeEnum
     */
    public GuliException(ResultCodeEnum resultCodeEnum) {
        super(resultCodeEnum.getMsg());
        this.msg = resultCodeEnum.getMsg();
        this.code = resultCodeEnum.getCode();
    }
}
