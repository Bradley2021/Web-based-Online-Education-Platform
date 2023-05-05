package com.kuang.eduorder.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.kuang.common.utils.JwtUtils;
import com.kuang.common.utils.R;
import com.kuang.eduorder.entity.Order;
import com.kuang.eduorder.service.OrderService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 订单 前端控制器
 *
 * @author testjava
 * @since 2020-11-02
 */
@Api(description = "查询支付订单模块")
@RestController
@RequestMapping("/eduorder/order")
//@CrossOrigin
public class OrderController {

    @Autowired
    private OrderService orderService;

    @GetMapping("111")
    public R s(){
        return R.ok();
    }

    @ApiOperation(value = "生成订单的方法")
    @PostMapping("/createOrder/{courseId}")
    public R saveOrder(@PathVariable String courseId, HttpServletRequest request) {
        //创建订单，返回订单号
        String orderNo = orderService.createOrders(courseId, JwtUtils.getMemberIdByJwtToken(request));
        return R.ok().data("orderId", orderNo);
    }

    @ApiOperation(value = "根据订单id查询订单信息")
    @GetMapping("/getOrderInfo/{orderId}")
    public R getOrderInfo(@PathVariable String orderId) {
        QueryWrapper<Order> wrapper = new QueryWrapper<>();
        wrapper.eq("order_no", orderId);

        Order order = orderService.getOne(wrapper);
        return R.ok().data("item", order);
    }

    @ApiOperation(value = "根据课程id和用户id查询订单中订单状态")
    @GetMapping("/isBuyCourse/{courseId}/{memberId}")
    public boolean isBuyCourse(@PathVariable String courseId, @PathVariable String memberId) {
        QueryWrapper<Order> wrapper = new QueryWrapper<>();
        wrapper.eq("course_id", courseId);
        wrapper.eq("member_id", memberId);
        //支付状态 1代表已支付
        wrapper.eq("status", 1);

        int count = orderService.count(wrapper);
        if (count > 0) {
            return true;
        } else {
            return false;
        }
    }

    @ApiOperation(value = "带条件分页的订单列表")
    @PostMapping("/pageOrder/{current}/{limit}")
    public R pageOrder(
            @ApiParam(name = "current", value = "当前页码", required = true)
            @PathVariable Long current,
            @ApiParam(name = "limit", value = "每页记录数", required = true)
            @PathVariable Long limit,
            @RequestBody(required = false) Order order) {
        //创page对象
        Page<Order> orderPage = new Page<>(current, limit);

        //构建条件
        QueryWrapper<Order> wrapper = new QueryWrapper<>();
        if (!StringUtils.isEmpty(order.getOrderNo())) {
            wrapper.like("order_no", order.getOrderNo());
        }
        //排序
        wrapper.orderByDesc("gmt_create");

        //调用方法实现分页
        orderService.page(orderPage, wrapper);

        long total = orderPage.getTotal();
        List<Order> records = orderPage.getRecords();

        return R.ok().data("total", total).data("rows", records);
    }


    @GetMapping("/a")
    public R p(){
        return R.ok();
    }
}
