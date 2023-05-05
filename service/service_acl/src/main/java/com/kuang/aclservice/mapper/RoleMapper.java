package com.kuang.aclservice.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.kuang.aclservice.entity.Role;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author testjava
 * @since 2020-01-12
 */
public interface RoleMapper extends BaseMapper<Role> {

    /**
     * 修改角色状态
     * @param role
     * @return
     */
    int changeStatus(Role role);

    /**
     * 删除角色权限关联
     * @param id
     * @return
     */
    int deleteRolePermission(String id);

    /**
     * 检查角色是否被分配出去
     * @param roleId
     * @return
     */
    int checkRole(String roleId);
}
