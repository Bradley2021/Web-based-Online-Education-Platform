package com.kuang.eduservice.client;

import com.kuang.common.utils.R;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

/**
 * @Description:
 * @Author: StarSea99
 * @Date: 2020-11-03 12:31
 */
@Component
@FeignClient("service-order")
public interface OrdersClient {

    /**
     * 根据课程id和用户id查询订单中订单状态
     * @param courseId
     * @param memberId
     * @return
     */
    @GetMapping("/eduorder/order/isBuyCourse/{courseId}/{memberId}")
    public boolean isBuyCourse(@PathVariable("courseId") String courseId, @PathVariable("memberId") String memberId);

    @GetMapping("/eduorder/order/a")
    R aa();

}
