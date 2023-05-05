package com.kuang.eduservice.entity.subject;

import io.swagger.annotations.ApiModel;
import lombok.Data;

/**
 * @Description: 二级分类
 * @Author: StarSea99
 * @Date: 2020-10-13 19:32
 */
@ApiModel(value = "Subject添加数据", description = "课程二级分类")
@Data
public class TwoSubject {
    private String id;
    private String title;
}
