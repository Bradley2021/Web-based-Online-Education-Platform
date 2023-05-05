package com.kuang.eduservice.entity.chapter;

import com.kuang.eduservice.entity.EduChapter;
import io.swagger.annotations.ApiModel;
import lombok.Data;

import java.util.ArrayList;
import java.util.List;

/**
 * @Description:
 * @Author: StarSea99
 * @Date: 2020-10-19 12:25
 */
@ApiModel(value = "章节封装类",description = "章节封装类")
@Data
public class ChapterVo {

    private String id;

    private String title;

    //表示小节
    private List<VideoVo> children = new ArrayList<>();


    private List<EduChapter> chapters = new ArrayList<>();
}
