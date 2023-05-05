package com.kuang.educenter;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.context.annotation.ComponentScan;

/**
 * @Description: 用户端登录注册、微信登录模块
 * @Author: StarSea99
 * @Date: 2020-10-25 16:22
 */
@SpringBootApplication
@ComponentScan(basePackages = {"com.kuang"})
@EnableDiscoveryClient
@MapperScan("com.kuang.educenter.mapper")
public class ServiceUcenterApplication {

    public static void main(String[] args) {
        SpringApplication.run(ServiceUcenterApplication.class, args);
    }
}
