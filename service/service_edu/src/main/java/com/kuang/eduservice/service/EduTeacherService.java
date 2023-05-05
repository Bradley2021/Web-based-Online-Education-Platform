package com.kuang.eduservice.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.kuang.eduservice.entity.EduTeacher;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.Map;

/**
 * <p>
 * 讲师 服务类
 * </p>
 *
 * @author testjava
 * @since 2020-09-27
 */
public interface EduTeacherService extends IService<EduTeacher> {

    Map<String,Object> getTeacherFrontList(Page<EduTeacher> pageTeacher);

    /**
     * 更新审核
     * @param eduTeacher
     * @return
     */
    boolean updateAudit(EduTeacher eduTeacher);
}
