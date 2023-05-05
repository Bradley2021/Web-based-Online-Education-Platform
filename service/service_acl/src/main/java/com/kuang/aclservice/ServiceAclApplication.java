package com.kuang.aclservice;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.context.annotation.ComponentScan;

/**
 * @Description: 用户管理模块
 * @Author: StarSea99
 * @Date: 2020-11-05 11:41
 */
@SpringBootApplication
@EnableDiscoveryClient
@ComponentScan("com.kuang")
@MapperScan("com.kuang.aclservice.mapper")
public class ServiceAclApplication {

    public static void main(String[] args) {
        SpringApplication.run(ServiceAclApplication.class, args);
    }
}
