package com.kuang.eduservice.service;

import com.kuang.eduservice.entity.EduChapter;
import com.baomidou.mybatisplus.extension.service.IService;
import com.kuang.eduservice.entity.chapter.ChapterVo;

import java.util.List;

/**
 * <p>
 * 课程 服务类
 * </p>
 *
 * @author testjava
 * @since 2020-10-15
 */
public interface EduChapterService extends IService<EduChapter> {

    List<ChapterVo> getChapterVideoByCourseId(String courseId);

    boolean deleteChapter(String chapterId);

    void removeChapterByCourseId(String courseId);

    ChapterVo getChapterVideoByAll(String cpId);
}
