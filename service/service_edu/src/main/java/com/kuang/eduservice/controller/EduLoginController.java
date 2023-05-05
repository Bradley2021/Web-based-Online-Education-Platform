package com.kuang.eduservice.controller;

import com.kuang.common.utils.R;
import org.springframework.web.bind.annotation.*;

/**
 * @Description:
 * @Author: StarSea99
 * @Date: 2020-10-04 14:25
 */
@RestController
@RequestMapping("/eduservice/user")
//@CrossOrigin  //解决跨域
public class EduLoginController {

    /**
     * 用户登录
     * @return
     */
    @PostMapping("/login")
    public R login() {
        return R.ok().data("token","admin");
    }

    /**
     * 查询用户信息
     * @return
     */
    @GetMapping("/info")
    public R info() {
        return R.ok().data("roles","[admin]").data("name","admin").data("avatar","https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif");
    }
}
