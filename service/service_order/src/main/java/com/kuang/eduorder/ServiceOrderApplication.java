package com.kuang.eduorder;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.ComponentScan;

/**
 * @Description: 订单管理
 * @Author: StarSea99
 * @Date: 2020-11-02 18:53
 */
@SpringBootApplication
@ComponentScan(basePackages = {"com.kuang"})
@MapperScan("com.kuang.eduorder.mapper")
@EnableDiscoveryClient
@EnableFeignClients
public class ServiceOrderApplication {

    public static void main(String[] args) {
        SpringApplication.run(ServiceOrderApplication.class, args);
    }
}
