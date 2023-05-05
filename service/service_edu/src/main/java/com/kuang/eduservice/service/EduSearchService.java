package com.kuang.eduservice.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.kuang.common.utils.R;
import com.kuang.eduservice.entity.EduCourse;


public interface EduSearchService extends IService<EduCourse> {
    public R searchCourseByKeyword(String Keyword, Integer index);
}
