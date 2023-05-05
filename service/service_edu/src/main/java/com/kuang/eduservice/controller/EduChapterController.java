package com.kuang.eduservice.controller;

import com.alibaba.fastjson.JSONObject;
import com.kuang.common.utils.R;
import com.kuang.eduservice.entity.EduChapter;
import com.kuang.eduservice.entity.chapter.ChapterVo;
import com.kuang.eduservice.service.EduChapterService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
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
@Api(description = "章节")
@RestController
@RequestMapping("/eduservice/chapter")
//@CrossOrigin
public class EduChapterController {

    @Autowired
    private EduChapterService chapterService;

    //根据课程id进行查询
    @ApiOperation(value = "课程大纲列表")
    @GetMapping("getChapterVideo/{courseId}")
    public R getChapterVideo(@PathVariable String courseId){
        List<ChapterVo> list = chapterService.getChapterVideoByCourseId(courseId);
        return R.ok().data("allChapterVideo",list);
    }

    @ApiOperation(value = "添加章节")
    @PostMapping("addChapter")
    public R addChapter(@RequestBody EduChapter eduChapter){
        chapterService.save(eduChapter);
        return R.ok();
    }

    @ApiOperation(value = "根据章节id查询")
    @GetMapping("getChapterInfo/{chapterId}")
    public R getChapterInfo(@PathVariable String chapterId) {
        EduChapter eduChapter = chapterService.getById(chapterId);
        return R.ok().data("chapter",eduChapter);
    }

    @ApiOperation(value = "获取章节里面的详情信息，返回章节的课程名称以及课程内容")
    @GetMapping("getChapterAndCourse/{id}")
    public R getChapterInfoDetail(@PathVariable String id){
        ChapterVo chapterVideoByAll = chapterService.getChapterVideoByAll(id);
        JSONObject json = new JSONObject();
        if(chapterVideoByAll == null){
            return R.ok().data(null);
        }
        json.put("courseId", chapterVideoByAll.getId());
        json.put("title", chapterVideoByAll.getTitle());
        json.put("chapter", chapterVideoByAll.getChapters());
        json.put("video", chapterVideoByAll.getChildren());

        return R.ok().data(json);
    }

    @ApiOperation(value = "修改章节")
    @PostMapping("updateChapter")
    public R updateChapter(@RequestBody EduChapter eduChapter){
        chapterService.updateById(eduChapter);
        return R.ok();
    }

    @ApiOperation(value = "删除章节")
    @DeleteMapping("deleteChapter/{chapterId}")
    public R deleteChapter(@PathVariable String chapterId){
        boolean flag = chapterService.deleteChapter(chapterId);
        if (flag){
            return R.ok();
        }else {
            return R.error();
        }
    }
}
