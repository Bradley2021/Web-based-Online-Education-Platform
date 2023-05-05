package com.kuang.eduservice.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.kuang.eduservice.entity.EduChapter;
import com.kuang.eduservice.entity.EduCourse;
import com.kuang.eduservice.entity.EduVideo;
import com.kuang.eduservice.entity.chapter.ChapterVo;
import com.kuang.eduservice.entity.chapter.VideoVo;
import com.kuang.eduservice.mapper.EduChapterMapper;
import com.kuang.eduservice.mapper.EduVideoMapper;
import com.kuang.eduservice.service.EduChapterService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.kuang.eduservice.service.EduCourseService;
import com.kuang.eduservice.service.EduVideoService;
import com.kuang.common.base.ExceptionHandler.GuliException;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

/**
 * <p>
 * 课程 服务实现类
 * </p>
 *
 * @author testjava
 * @since 2020-10-15
 */
@Service
public class EduChapterServiceImpl extends ServiceImpl<EduChapterMapper, EduChapter> implements EduChapterService {

    @Autowired
    private EduVideoService videoService;

    @Autowired
    private EduCourseService courseService;

    @Autowired
    private EduVideoMapper videoMapper;

    @Override
    public List<ChapterVo> getChapterVideoByCourseId(String courseId) {

        //1 根据课程id查询课程里面的章节
        QueryWrapper<EduChapter> wrapperChapter = new QueryWrapper<>();
        wrapperChapter.eq("course_id",courseId);
        List<EduChapter> eduChapterList = baseMapper.selectList(wrapperChapter);

        //2 根据课程id查询课程里面的小节
        QueryWrapper<EduVideo> wrapperVideo = new QueryWrapper<>();
        wrapperVideo.eq("course_id",courseId);
        List<EduVideo> eduVideoList = videoService.list(wrapperVideo);

        //创建list集合，用于最终封装的集合
        List<ChapterVo> finallList = new ArrayList<>();

        //3 遍历查询章节list集合进行封装
        for (int i = 0; i < eduChapterList.size(); i++) {
            //得到每个章节
            EduChapter eduChapter = eduChapterList.get(i);
            //将edChapter对象复制到ChapterVo里面
            ChapterVo chapterVo = new ChapterVo();
            BeanUtils.copyProperties(eduChapter,chapterVo);
            //把chapterVo放到最终的list集合中
            finallList.add(chapterVo);

            //创建集合，用于封装章节中的小节
            List<VideoVo> videoList = new ArrayList<>();

            //4 遍历查询小节list集合进行封装
            for (int m = 0; m < eduVideoList.size(); m++) {
                //得到每个小节
                EduVideo eduVideo = eduVideoList.get(m);
                //判断：小节里面chapterid和章节里面的id是否一样
                if (eduVideo.getChapterId().equals(eduChapter.getId())) {
                    //进行封装
                    VideoVo videoVo = new VideoVo();
                    BeanUtils.copyProperties(eduVideo,videoVo);
                    //放在小节的集合中
                    videoList.add(videoVo);
                }
            }
            //把封装之后的小节list集合，放到章节对象里面
            chapterVo.setChildren(videoList);
        }
        return finallList;
    }

    @Override
    public boolean deleteChapter(String chapterId) {
        //根据chapterid章节id查询小节表，如果查询到数据，不进行删除
        QueryWrapper<EduVideo> wrapper = new QueryWrapper<>();
        wrapper.eq("chapter_id",chapterId);
        int count = videoService.count(wrapper);

        if (count > 0) {//查询出小节，不进行删除
            throw new GuliException(20001,"不能删除");
        }else{//没有查询数据，进行删除
            //删除章节
            int result = baseMapper.deleteById(chapterId);
            //成功 1>0  0>0
            return result>0;
        }
    }

    @Override
    public void removeChapterByCourseId(String courseId) {
        QueryWrapper<EduChapter> wrapper =new QueryWrapper<>();
        wrapper.eq("course_id",courseId);
        baseMapper.delete(wrapper);
    }

    @Override
    public ChapterVo getChapterVideoByAll(String cpId) {
        EduChapter eduChapter = baseMapper.selectById(cpId);
        if(eduChapter == null){
            return null;
        }
        List<EduChapter> chapterList = baseMapper.selectList(new QueryWrapper<EduChapter>().eq("course_id", eduChapter.getCourseId()));
        ChapterVo vo = new ChapterVo();
        EduCourse byId = courseService.getById(eduChapter.getCourseId());

        vo.setTitle(byId.getTitle());
        vo.setId(eduChapter.getCourseId());
        vo.setChapters(chapterList);

        // 查询视频信息
        List<EduVideo> chapterId = videoMapper.selectList(new QueryWrapper<EduVideo>().in("chapter_id", chapterList.
                stream()
                .map(EduChapter::getId).collect(Collectors.toList())
        ));
        List<VideoVo> collect = chapterId.stream().map(element -> {
            VideoVo videoVo = new VideoVo();
            videoVo.setId(element.getId());
            videoVo.setVideoSourceId(element.getVideoSourceId());
            videoVo.setChapterId(element.getChapterId());
            return videoVo;
        }).collect(Collectors.toList());
        vo.setChildren(collect);
        return vo;
    }
}
