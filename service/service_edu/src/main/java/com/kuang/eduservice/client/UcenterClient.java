package com.kuang.eduservice.client;

import com.kuang.common.utils.commentvo.UcenterMemberVo;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

/**
 * @Description:
 * @Author: StarSea99
 * @Date: 2020-11-01 16:20
 */
@FeignClient(name = "service-ucenter",fallback = UcenterFileDegradeFeginClient.class)
@Component
public interface UcenterClient {

    @PostMapping("/educenter/member/getInfoUc/{id}")
    UcenterMemberVo getInfoUc(@PathVariable("id") String id);

}
