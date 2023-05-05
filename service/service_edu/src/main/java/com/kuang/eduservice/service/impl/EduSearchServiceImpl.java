package com.kuang.eduservice.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.kuang.common.utils.R;
import com.kuang.eduservice.entity.EduCourse;
import com.kuang.eduservice.mapper.EduCourseMapper;
import com.kuang.eduservice.service.EduSearchService;
import io.swagger.models.auth.In;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class EduSearchServiceImpl extends ServiceImpl<EduCourseMapper, EduCourse> implements EduSearchService {

    public R searchCourseByKeyword(String keyword, Integer index){
        List<EduCourse> courseList = baseMapper.searchByKeyword(keyword,index);

        courseList = courseList.stream().filter(a -> a.getIsDeleted() != 1).collect(Collectors.toList());

        return R.ok().data("search_result",courseList);
    }

}
