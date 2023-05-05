package com.kuang.eduorder.controller;


import com.kuang.common.utils.R;
import com.kuang.eduorder.service.PayLogService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

/**
 * 支付日志表 前端控制器
 *
 * @author testjava
 * @since 2020-11-02
 */
@Api(description = "微信支付管理")
@RestController
@RequestMapping("/eduorder/paylog")
//@CrossOrigin
public class PayLogController {

    @Autowired
    private PayLogService payLogService;

    @ApiOperation(value = "生成微信支付二维码接口")
    @GetMapping("createNative/{orderNo}")
    public R createNative(@PathVariable String orderNo) {
        //返回信息，包含二维码地址，还有其他需要的信息
        Map map = payLogService.createNative(orderNo);
        System.out.println("****返回二维码map集合"+map);
        return R.ok().data(map);
    }

    @ApiOperation(value = "查询订单支付状态")
    @GetMapping("queryPayStatus/{orderNo}")
    public R queryPayStatus(@PathVariable String orderNo) {
        Map<String,String> map = payLogService.queryPayStatus(orderNo);
        System.out.println("****查询订单状态："+map);
        if (map == null) {
            return R.error().message("支付出错了");
        }
        //如果返回map不为空，通过map获取订单状态
        if (map.get("trade_state").equals("SUCCESS")) {//支付成功
           //添加记录到支付表，更新订单表订单状态
           payLogService.updateOrdersStatus(map);
           return R.ok().message("支付成功");
        }
        return R.ok().code(25000).message("订单支付中");
    }

}

/**
 ****返回二维码map集合{course_id=1318747112317362177,
 *  out_trade_no=20201104121112927,
 *  code_url=weixin://wxpay/bizpayurl?pr=QNC1GAZ00,
 *  total_fee=0.01,
 *  result_code=SUCCESS}

 ****查询订单状态：{nonce_str=F3Joo4QWhZjr7XNf, device_info=,
 * out_trade_no=20201104121112927, trade_state=NOTPAY,
 * appid=wx74862e0dfcf69954, total_fee=1,
 * sign=AAF4F8F0C779AB5A97E9C21B6856BA4C,
 * trade_state_desc=订单未支付, return_msg=OK,
 * result_code=SUCCESS, mch_id=1558950191, return_code=SUCCESS}

 ****查询订单状态：{transaction_id=4200000826202011042036448743,
 *  nonce_str=A4Q9nklDzK0xvWRr, trade_state=SUCCESS, bank_type=OTHERS,
 *  openid=oHwsHuFJML39xfpy4armetXTJKnI, sign=082E415CF4F442C1A47D837224226E78,
 *  return_msg=OK, fee_type=CNY, mch_id=1558950191, cash_fee=1,
 *  out_trade_no=20201104121112927, cash_fee_type=CNY,
 *  appid=wx74862e0dfcf69954, total_fee=1, trade_state_desc=支付成功,
 *  trade_type=NATIVE, result_code=SUCCESS, attach=, time_end=20201104121130,
 *  is_subscribe=N, return_code=SUCCESS}
 */