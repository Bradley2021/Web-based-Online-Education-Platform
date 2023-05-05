package com.kuang.aclservice.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.kuang.aclservice.entity.Role;

import java.util.List;
import java.util.Map;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author testjava
 * @since 2020-01-12
 */
public interface RoleService extends IService<Role> {

    /**
     * 根据用户获取角色数据
     * @param userId
     * @return
     */
    Map<String, Object> findRoleByUserId(String userId);

    /**
     * 根据用户分配角色
     * @param userId
     * @param roleId
     */
    void saveUserRoleRealtionShip(String userId, String[] roleId);

    /**
     * 根据用户id获取角色
     * @param id
     * @return
     */
    List<Role> selectRoleByUserId(String id);

    /**
     * 修改角色状态
     * @param role
     * @return
     */
    int changeStatus(Role role);

    /**
     * 删除角色权限关联
     * @param id
     */
    int deleteRolePermission(String id);

    /**
     * 检查角色是否被分配出去
     * @param roleId
     * @return
     */
    boolean checkRole(String roleId);
}
