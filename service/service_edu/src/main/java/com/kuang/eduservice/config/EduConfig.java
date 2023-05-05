package com.kuang.eduservice.config;

import com.baomidou.mybatisplus.core.injector.ISqlInjector;
import com.baomidou.mybatisplus.extension.injector.LogicSqlInjector;
import com.baomidou.mybatisplus.extension.plugins.PaginationInterceptor;
import com.baomidou.mybatisplus.extension.plugins.PerformanceInterceptor;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;

/**
 * @Description:
 * @Author: StarSea99
 * @Date: 2020-09-27 15:57
 */
@Configuration
@MapperScan("com.kuang.eduservice.mapper")
public class EduConfig {

    //逻辑删除组件
    @Bean
    public ISqlInjector sqlInjector(){
        return new LogicSqlInjector();
    }

    //分页插件
    @Bean
    public PaginationInterceptor paginationInterceptor(){
        return new PaginationInterceptor();
    }

    // SQL 执行效率插件
    /*@Bean
    @Profile({"dev","test"})// 设置 dev、test环境开启，保证我们的效率
    public PerformanceInterceptor performanceInterceptor(){
        PerformanceInterceptor performanceInterceptor =new PerformanceInterceptor();
        performanceInterceptor.setMaxTime(100);// ms  设置SQL执行的最大时间，如果超过了则就不执行
        performanceInterceptor.setFormat(true);// 是否格式化代码
        return performanceInterceptor;
    }*/

}
