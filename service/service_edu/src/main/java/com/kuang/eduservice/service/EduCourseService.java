package com.kuang.eduservice.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.kuang.eduservice.entity.EduCourse;
import com.baomidou.mybatisplus.extension.service.IService;
import com.kuang.eduservice.entity.frontVo.CourseFrontVo;
import com.kuang.eduservice.entity.frontVo.CourseWebVo;
import com.kuang.eduservice.entity.vo.CourseInfoVo;
import com.kuang.eduservice.entity.vo.CoursePublishVo;

import java.util.Map;

/**
 * <p>
 * 课程 服务类
 * </p>
 *
 * @author testjava
 * @since 2020-10-15
 */
public interface EduCourseService extends IService<EduCourse> {

    String saveCourseInfo(CourseInfoVo courseInfoVo);

    CourseInfoVo getCourseInfo(String courseId);

    void updateCourseInfo(CourseInfoVo courseInfoVo);

    CoursePublishVo publishCourseInfo(String id);

    void removeCourse(String courseId);

    Map<String,Object> getCourseFrontList(Page<EduCourse> pageCourse, CourseFrontVo courseFrontVo);

    CourseWebVo getBaseCourseInfo(String courseId);

    int default1(EduCourse course);


}
