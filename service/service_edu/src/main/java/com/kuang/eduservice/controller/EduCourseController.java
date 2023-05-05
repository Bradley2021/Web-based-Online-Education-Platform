package com.kuang.eduservice.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.kuang.common.utils.R;
import com.kuang.eduservice.entity.EduCourse;
import com.kuang.eduservice.entity.vo.CourseInfoVo;
import com.kuang.eduservice.entity.vo.CoursePublishVo;
import com.kuang.eduservice.entity.vo.CourseQuery;
import com.kuang.eduservice.service.EduCourseService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 * 课程 前端控制器
 * </p>
 *
 * @author testjava
 * @since 2020-10-15
 */
@Api(description = "课程管理")
@RestController
@RequestMapping("/eduservice/course")
//@CrossOrigin
public class EduCourseController {

    @Autowired
    private EduCourseService courseService;

    @ApiOperation(value = "课程列表")
    @GetMapping("getCourseList")
    public R getCourseList(){
        List<EduCourse> list = courseService.list(null);
        return R.ok().data("list",list);
    }

    @ApiOperation(value = "分页查询课程列表")
    @PostMapping("pageListCourse/{current}/{limit}")
    public R pageListCourse(
            @ApiParam(name = "current", value = "当前页码", required = true)
            @PathVariable Long current,
            @ApiParam(name = "limit", value = "每页记录数", required = true)
            @PathVariable Long limit){
        //创建page对象
        Page<EduCourse> pageCourse =new Page<>(current,limit);

        //调用方法查询
        courseService.page(pageCourse,null);

        long total = pageCourse.getTotal();
        List<EduCourse> courseList = pageCourse.getRecords();

        return R.ok().data("total",total).data("rows",courseList);
    }

    //TODO 带条件的分页查询
    @ApiOperation(value = "条件查询带分页课程列表")
    @PostMapping("pageCourseCondition/{current}/{limit}")
    public R pageCourseCondition(
            @ApiParam(name = "current", value = "当前页码", required = true)
            @PathVariable Long current,
            @ApiParam(name = "limit", value = "每页记录数", required = true)
            @PathVariable Long limit,
            @RequestBody(required = false) CourseQuery courseQuery){
        //创建page对象
        Page<EduCourse> pageCourse = new Page<>(current,limit);

        //构建条件
        QueryWrapper<EduCourse> wrapper = new QueryWrapper<>();

        //组合条件查询
        String title = courseQuery.getTitle();
        String status = courseQuery.getStatus();

        //判断是否为空，不为空就拼接查询
        if (!StringUtils.isEmpty(title)) {
            wrapper.like("title",title);
        }
        if (!StringUtils.isEmpty(status)) {
            wrapper.eq("status",status);
        }

        //调用方法查询
        courseService.page(pageCourse,wrapper);

        long total = pageCourse.getTotal();
        List<EduCourse> courseList = pageCourse.getRecords();

        return R.ok().data("total",total).data("rows",courseList);
    }

    @ApiOperation(value = "删除课程")
    @PostMapping("deleteCourse/{courseId}")
    public R deleteCourse(@PathVariable String courseId){
        courseService.removeCourse(courseId);
        return R.ok();
    }

    @ApiOperation(value = "添加课程基本信息")
    @PostMapping("addCourseInfo")
    public R addCourseInfo(@RequestBody CourseInfoVo courseInfoVo){
        //返回添加之后课程id，为了后面添加大纲使用
        String id = courseService.saveCourseInfo(courseInfoVo);
        return R.ok().data("courseId",id);
    }

    @ApiOperation(value = "根据课程查询课程基本信息")
    @GetMapping("getCourseInfo/{courseId}")
    public R getCourseInfo(@PathVariable String courseId) {
        CourseInfoVo courseInfoVo = courseService.getCourseInfo(courseId);
        return R.ok().data("courseInfoVo",courseInfoVo);
    }

    @ApiOperation(value = "根据id修改课程信息")
    @PostMapping("updateCourseInfo")
    public R updateCourseInfo(@RequestBody CourseInfoVo courseInfoVo) {
        courseService.updateCourseInfo(courseInfoVo);
        return R.ok();
    }

    @ApiOperation(value = "根据课程id查询课程确认信息")
    @GetMapping("getPublishCourseInfo/{id}")
    public R getPublishCourseInfo(@PathVariable String id) {
        CoursePublishVo coursePublishVo = courseService.publishCourseInfo(id);
        return R.ok().data("publishCourse",coursePublishVo);
    }
//org.apache.ibatis.binding.BindingException: Invalid bound statement (not found): com.kuang.eduservice.mapper.EduCourseMapper.getPublicCourseInfo

    @ApiOperation(value = "课程最终发布修改课程状态")
    @PostMapping("publishCourse/{id}")
    public R publishCourse(@PathVariable String id) {
        EduCourse eduCourse = new EduCourse();
        eduCourse.setId(id);
        eduCourse.setStatus("Normal");//设置课程发布状态
        courseService.updateById(eduCourse);
        return R.ok();
    }
}
