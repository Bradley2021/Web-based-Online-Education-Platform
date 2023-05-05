package com.kuang.aclservice.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.kuang.aclservice.entity.User;
import com.kuang.aclservice.mapper.UserMapper;
import com.kuang.aclservice.service.UserService;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 用户表 服务实现类
 * </p>
 *
 * @author testjava
 * @since 2020-01-12
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {

    @Override
    public User selectByUsername(String username) {
        return baseMapper.selectOne(new QueryWrapper<User>().eq("username", username));
    }

    /**
     * 根据用户id修改用户状态
     *
     * @param user
     * @return
     */
    @Override
    public int changeStatus(User user) {
        return baseMapper.changeStatus(user);
    }

    /**
     * 删除用户角色表
     *
     * @param id
     * @return
     */
    @Override
    public int deleteUserRole(String id) {
        return baseMapper.deleteUserRole(id);
    }
}
