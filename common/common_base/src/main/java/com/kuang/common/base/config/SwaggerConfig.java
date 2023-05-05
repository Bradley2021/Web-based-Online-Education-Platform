package com.kuang.common.base.config;

import com.google.common.base.Predicates;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Contact;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

/**
 * @Description: swagger2配置文件
 * @Author: StarSea99
 * @Date: 2020-09-27 17:58
 */
@Configuration//配置类
@EnableSwagger2//swagger注解
public class SwaggerConfig {

    @Bean
    public Docket weApiConfig(){
        return new Docket(DocumentationType.SWAGGER_2)
                .groupName("webApi")
                .apiInfo(webApiInfo())
                .select()
                //.paths(Predicates.not(PathSelectors.regex("/admin/.*")))
                .paths(Predicates.not(PathSelectors.regex("/error.*")))
                .build();
    }

    private ApiInfo webApiInfo(){
        return new ApiInfoBuilder()
                .title("网站-课程中心API文档")
                .description("本文档描述类课程中心微服务接口定义")
                .version("1.0")
                .contact(new Contact("追梦少年","https://blog.csdn.net/weixin_45606067/","1065510476@qq.com"))
                .build();
    }
}
