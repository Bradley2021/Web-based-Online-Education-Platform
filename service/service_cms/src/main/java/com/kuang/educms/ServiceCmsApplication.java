package com.kuang.educms;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

/**
 * @Description: 轮播图模块
 * @Author: StarSea99
 * @Date: 2020-10-24 13:19
 */
@SpringBootApplication
@ComponentScan({"com.kuang"})//指定扫描位置
@MapperScan("com.kuang.educms.mapper")
public class ServiceCmsApplication {

    public static void main(String[] args) {
        SpringApplication.run(ServiceCmsApplication.class, args);
    }
}
