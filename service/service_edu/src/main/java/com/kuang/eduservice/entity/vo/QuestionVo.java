package com.kuang.eduservice.entity.vo;

import com.kuang.common.utils.commentvo.UcenterMemberVo;
import lombok.Data;

@Data
public class QuestionVo {

    Long id;

    String content;

    String description;

    UcenterMemberVo user;
}
