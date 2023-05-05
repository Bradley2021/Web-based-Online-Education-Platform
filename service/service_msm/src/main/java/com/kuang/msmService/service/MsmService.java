package com.kuang.msmService.service;

import java.util.Map;

/**
 * @Description:
 * @Author: StarSea99
 * @Date: 2020-10-25 15:33
 */
public interface MsmService {
    /**
     * 发送短信验证码
     * @param param
     * @param phone
     * @return
     */
    boolean send(Map<String, Object> param, String phone);
}
