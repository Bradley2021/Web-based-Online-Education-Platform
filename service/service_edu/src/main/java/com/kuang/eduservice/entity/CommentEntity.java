package com.kuang.eduservice.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@TableName("edu_view")
@Data
public class CommentEntity { //查询评论的

    public Long id;

    public Long submitUser;

    public String content;

    public Long postId;
}
