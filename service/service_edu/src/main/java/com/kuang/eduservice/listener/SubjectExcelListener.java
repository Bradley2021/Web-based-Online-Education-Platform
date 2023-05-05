package com.kuang.eduservice.listener;

import com.alibaba.excel.context.AnalysisContext;
import com.alibaba.excel.event.AnalysisEventListener;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.kuang.eduservice.entity.EduSubject;
import com.kuang.eduservice.entity.excel.SubjectData;
import com.kuang.eduservice.service.EduSubjectService;
import com.kuang.common.base.ExceptionHandler.GuliException;

import java.util.Map;

/**
 * @Description:
 * @Author: StarSea99
 * @Date: 2020-10-12 10:18
 */
public class SubjectExcelListener extends AnalysisEventListener<SubjectData> {

    //因为SubjectExcelListener不能交给Spring进行管理，需要自己new，不能注入其他对象
    //不能实现数据库操作
    private EduSubjectService subjectService;

    public SubjectExcelListener() {}
    public SubjectExcelListener(EduSubjectService subjectService) {
        this.subjectService = subjectService;
    }

    //一行一行去读取excle内容
    @Override
    public void invoke(SubjectData subjectData, AnalysisContext analysisContext) {
        if(subjectData == null) {
            throw new GuliException(20001,"文件数据为空");
        }
        //添加一级分类
        EduSubject existOneSubject = this.existOneSubject(subjectService,subjectData.getOneSujectName());
        if(existOneSubject == null) {//没有相同以及分类名称
            existOneSubject = new EduSubject();
            existOneSubject.setTitle(subjectData.getOneSujectName());//一级分类名称
            existOneSubject.setParentId("0");
            subjectService.save(existOneSubject);
        }

        //获取一级分类id值
        String pid = existOneSubject.getId();

        //添加二级分类
        EduSubject existTwoSubject = this.existTwoSubject(subjectService,subjectData.getTwoSujectName(), pid);
        if(existTwoSubject == null) {
            existTwoSubject = new EduSubject();
            existTwoSubject.setTitle(subjectData.getTwoSujectName());//二级分类
            existTwoSubject.setParentId(pid);
            subjectService.save(existTwoSubject);
        }
    }

    //判断一级分类是否重复
    private EduSubject existOneSubject(EduSubjectService subjectService,String name) {
        QueryWrapper<EduSubject> wrapper = new QueryWrapper<>();
        wrapper.eq("title",name);
        wrapper.eq("parent_id","0");
        EduSubject OneSubject = subjectService.getOne(wrapper);
        return OneSubject;
    }

    //判断二级分类是否重复
    private EduSubject existTwoSubject(EduSubjectService subjectService,String name,String pid) {
        QueryWrapper<EduSubject> wrapper = new QueryWrapper<>();
        wrapper.eq("title",name);
        wrapper.eq("parent_id",pid);
        EduSubject TwoSubject = subjectService.getOne(wrapper);
        return TwoSubject;
    }

    //读取excel表头信息
    @Override
    public void invokeHeadMap(Map<Integer, String> headMap, AnalysisContext context) {
        System.out.println("表头信息："+headMap);
    }

    //读取完成后执行
    @Override
    public void doAfterAllAnalysed(AnalysisContext analysisContext) {}

}
