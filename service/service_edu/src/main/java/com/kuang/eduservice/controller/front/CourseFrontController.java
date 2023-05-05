package com.kuang.eduservice.controller.front;

import com.alibaba.excel.util.StringUtils;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.kuang.common.utils.JwtUtils;
import com.kuang.common.utils.R;
import com.kuang.common.utils.ordervo.CourseWebVoOrder;
import com.kuang.eduservice.client.OrdersClient;
import com.kuang.eduservice.client.OrdersFileDegradeFeginClient;
import com.kuang.eduservice.entity.EduCourse;
import com.kuang.eduservice.entity.EduTeacher;
import com.kuang.eduservice.entity.chapter.ChapterVo;
import com.kuang.eduservice.entity.frontVo.CourseFrontVo;
import com.kuang.eduservice.entity.frontVo.CourseWebVo;
import com.kuang.eduservice.entity.vo.ListVo;
import com.kuang.eduservice.mapper.EduCourseMapper;
import com.kuang.eduservice.service.EduChapterService;
import com.kuang.eduservice.service.EduCourseService;
import com.kuang.eduservice.service.EduTeacherService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.poi.util.StringUtil;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Description:
 * @Author: StarSea99
 * @Date: 2020-10-29 15:02
 */
@Api(description = "课程管理前端")
@RestController
@RequestMapping("/eduservice/coursefront")
//@CrossOrigin
public class CourseFrontController {

    @Autowired
    private EduCourseService courseService;

    @Autowired
    private EduChapterService chapterService;

    @Autowired
    private EduTeacherService teacherService;

//    @Autowired
//    private OrdersFileDegradeFeginClient ordersClient;
    @Autowired
    private OrdersClient ordersClient;

    @Autowired
    private EduCourseMapper courseMapper;

    @ApiOperation(value = "条件查询带分页的课程")
    @PostMapping("getCourseFrontList/{page}/{limit}")
    public R getCourseFrontList(@PathVariable long page, @PathVariable long limit,
                                @RequestBody(required = false) CourseFrontVo courseFrontVo) {
        Page<EduCourse> pageCourse = new Page<>(page, limit);
        Map<String,Object> map = courseService.getCourseFrontList(pageCourse,courseFrontVo);
        //返回封装的数据
        return R.ok().data(map);
    }

    @ApiOperation(value = "课程详情方法")
    @GetMapping("/getCourseFrontInfo/{courseId}")
    public R getCourseFrontInfo(@PathVariable String courseId, HttpServletRequest request) {
        //根据课程id，编写sql语句查询课程信息
        CourseWebVo courseWebVo = courseService.getBaseCourseInfo(courseId);

        //根据课程id查询章节和小节
        List<ChapterVo> chapterVideoList = chapterService.getChapterVideoByCourseId(courseId);

        //根据课程id和用户id查询当前课程是否已经支付过
        //报错：feign.FeignException$NotFound: status 404 reading OrdersClient#isBuyCourse(String,String)
        String memberIdToken = JwtUtils.getMemberIdByJwtToken(request);
        if(StringUtils.isEmpty(memberIdToken)){
            memberIdToken = "4444";
        }
        boolean buyCourse = ordersClient.isBuyCourse(courseId, memberIdToken);

        return R.ok().data("courseWebVo",courseWebVo).data("chapterVideoList",chapterVideoList).data("isBuy",buyCourse);
    }

    @ApiOperation(value = "根据课程id查询课程信息")
    @PostMapping("getCourseInfoOrder/{id}")
    public CourseWebVoOrder getCourseInfoOrder(@PathVariable String id) {
        CourseWebVo courseInfo = courseService.getBaseCourseInfo(id);
        CourseWebVoOrder courseWebVoOrder = new CourseWebVoOrder();
        BeanUtils.copyProperties(courseInfo,courseWebVoOrder);
        return courseWebVoOrder;
    }

    @GetMapping("getTop10")
    public R getTop10(){
        Page<EduCourse> page = new Page<>(1,10);
        QueryWrapper<EduCourse> wrapper = new QueryWrapper<>();
//        IPage<EduCourse> view_count = courseService.page(page, wrapper.orderByDesc("gmt_create"));
//        IPage<EduCourse> buy_count = courseService.page(page, wrapper.orderByDesc("buy_count"));


        List<EduCourse> viewCount = courseMapper.selectList(wrapper.orderByDesc("gmt_create").last("limit 0, 10"));
        List<EduCourse> buyCount = courseMapper.selectList(wrapper.orderByDesc("buy_count").last("limit 0, 10"));


        List<ListVo> resList = new ArrayList<>();
        List<ListVo> resList2 = new ArrayList<>();
        viewCount.stream().forEach( ele ->{
            ListVo vo = new ListVo();
            vo.setLearned(ele.getBuyCount());
            vo.setCover(ele.getCover());
            vo.setId(Long.parseLong(ele.getId()));
            EduTeacher byId = teacherService.getById(ele.getTeacherId());
            vo.setTeacher(byId.getName());
            vo.setTitle(ele.getTitle());
            resList.add(vo);
        });

        buyCount.stream().forEach(ele ->{
            ListVo vo = new ListVo();
            vo.setLearned(ele.getBuyCount());
            vo.setCover(ele.getCover());
            vo.setId(Long.parseLong(ele.getId()));
            EduTeacher byId = teacherService.getById(ele.getTeacherId());
            vo.setTeacher(byId.getName());
            vo.setTitle(ele.getTitle());
            resList2.add(vo);
        });

        Map<String,Object> out = new HashMap<>();

        out.put("buy", resList2);
        out.put("view", resList);

        return R.ok().data(out);
    }

}
