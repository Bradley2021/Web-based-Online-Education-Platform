package com.kuang.eduservice.entity.subject;

import io.swagger.annotations.ApiModel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.List;

/**
 * @Description: 一级分类
 * @Author: StarSea99
 * @Date: 2020-10-13 19:32
 */
@ApiModel(value = "Subject添加数据", description = "课程一级分类")
@Data
public class OneSubject {
    private String id;
    private String title;

    //一个一级分类里面有多个二级分类
    private List<TwoSubject> children = new ArrayList<>();
}
