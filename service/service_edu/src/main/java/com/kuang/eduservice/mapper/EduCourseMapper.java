package com.kuang.eduservice.mapper;

import com.kuang.eduservice.entity.EduCourse;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.kuang.eduservice.entity.frontVo.CourseWebVo;
import com.kuang.eduservice.entity.vo.CoursePublishVo;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * <p>
 * 课程 Mapper 接口
 * </p>
 *
 * @author testjava
 * @since 2020-10-15
 */
@Mapper
public interface EduCourseMapper extends BaseMapper<EduCourse> {

    CoursePublishVo getPublicCourseInfo(String courseId);

    CourseWebVo getBaseCourseInfo(String courseId);

    List<EduCourse> searchByKeyword(String keyword, Integer index);

}
