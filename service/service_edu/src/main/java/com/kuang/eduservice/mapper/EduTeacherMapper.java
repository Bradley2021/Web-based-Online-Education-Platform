package com.kuang.eduservice.mapper;

import com.kuang.eduservice.entity.EduTeacher;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * <p>
 * 讲师 Mapper 接口
 * </p>
 *
 * @author testjava
 * @since 2020-09-27
 */
public interface EduTeacherMapper extends BaseMapper<EduTeacher> {

    /**
     * 更新审核
     * @param eduTeacher
     * @return
     */
    boolean updateAudit(EduTeacher eduTeacher);
}
