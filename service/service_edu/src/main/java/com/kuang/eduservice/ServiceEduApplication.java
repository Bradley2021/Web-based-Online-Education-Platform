package com.kuang.eduservice;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.ComponentScan;

/**
 * @Description: 课程管理模块
 * @Author: StarSea99
 * @Date: 2020-09-27 15:57
 */
@SpringBootApplication
//注册Nacos客户端
@EnableDiscoveryClient
//服务调用
@EnableFeignClients
@ComponentScan(basePackages = {"com.kuang"})
public class ServiceEduApplication {

    public static void main(String[] args) {
        SpringApplication.run(ServiceEduApplication.class, args);
    }

}
