package com.kuang.common.utils.commentvo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * @Description:
 * @Author: StarSea99
 * @Date: 2020-11-02 19:32
 */
@ApiModel(value = "评论封装类",description = "评论封装类")
@Data
public class UcenterMemberVo {

    @ApiModelProperty(value = "会员id")
    private String id;

    @ApiModelProperty(value = "昵称")
    private String nickname;

    @ApiModelProperty(value = "用户头像")
    private String avatar;

}
