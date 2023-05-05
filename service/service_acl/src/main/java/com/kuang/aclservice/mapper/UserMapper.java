package com.kuang.aclservice.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.kuang.aclservice.entity.User;

/**
 * <p>
 * 用户表 Mapper 接口
 * </p>
 *
 * @author testjava
 * @since 2020-01-12
 */
public interface UserMapper extends BaseMapper<User> {

    /**
     * 根据用户id修改用户状态
     *
     * @param user
     * @return
     */
    int changeStatus(User user);

    /**
     * 删除用户角色表
     * @param id
     * @return
     */
    int deleteUserRole(String id);
}
