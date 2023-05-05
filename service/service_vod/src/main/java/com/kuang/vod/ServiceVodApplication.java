package com.kuang.vod;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.context.annotation.ComponentScan;

/**
 * @Description: 阿里云视频服务模块
 * @Author: StarSea99
 * @Date: 2020-10-22 9:30
 */
@SpringBootApplication(exclude = DataSourceAutoConfiguration.class)//默认不去加载数据库配置
@EnableDiscoveryClient
@ComponentScan(basePackages = {"com.kuang"})
public class ServiceVodApplication {

    public static void main(String[] args) {
        SpringApplication.run(ServiceVodApplication.class,args);
    }
}
