package com.kuang.eduservice.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@TableName(value = "edu_question")
@Data
public class CourseEntity { //帖子的实体类

    public Long id;

    public Long submitUser;

    public String content;

    public String description;
}