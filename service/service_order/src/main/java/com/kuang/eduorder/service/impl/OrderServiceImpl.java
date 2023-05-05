package com.kuang.eduorder.service.impl;

import com.kuang.common.utils.ordervo.CourseWebVoOrder;
import com.kuang.common.utils.ordervo.UcenterMemberOrder;
import com.kuang.eduorder.client.EduClient;
import com.kuang.eduorder.client.UcenterClient;
import com.kuang.eduorder.entity.Order;
import com.kuang.eduorder.mapper.OrderMapper;
import com.kuang.eduorder.service.OrderService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.kuang.eduorder.utils.OrderNoUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 订单 服务实现类
 * </p>
 *
 * @author testjava
 * @since 2020-11-02
 */
@Service
public class OrderServiceImpl extends ServiceImpl<OrderMapper, Order> implements OrderService {

    @Autowired
    private EduClient eduClient;

    @Autowired
    private UcenterClient ucenterClient;

    //生成订单的方法
    @Override
    public String createOrders(String courseId, String memberId) {
        //通过远程调用：根据用户id获取用户信息
        UcenterMemberOrder userInfoOrder = ucenterClient.getUserInfoOrder(memberId);

        //通过远程调用：根据课程id获取课程信息
        CourseWebVoOrder courseInfoOrder = eduClient.getCourseInfoOrder(courseId);

        //创建order对象，向order对象里面设置数据
        Order order = new Order();
        order.setOrderNo(OrderNoUtil.getOrderNo());//订单号
        order.setCourseId(courseId); //课程id
        order.setCourseTitle(courseInfoOrder.getTitle());//课程名称
        order.setCourseCover(courseInfoOrder.getCover());
        order.setTeacherId(courseInfoOrder.getTeacherId());
        order.setTeacherName(courseInfoOrder.getTeacherName());
        order.setTotalFee(courseInfoOrder.getPrice());
        order.setMemberId(memberId);
        order.setMobile(userInfoOrder.getMobile());
        order.setNickname(userInfoOrder.getNickname());

        order.setStatus(0);  //订单状态（0：未支付 1：已支付）
        order.setPayType(1);  //支付类型 ，微信1

        baseMapper.insert(order);

        //返回订单号
        return order.getOrderNo();
    }
}
