package com.kuang.eduservice.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.kuang.eduservice.entity.CommentEntity;
import com.kuang.eduservice.entity.CourseEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface EduQuestionMapper extends BaseMapper<CourseEntity> {

//    @Select("select eq1.id, from edu_question eq1 " +
//            "left join edu_view ev on eq1.id=ev.post_id " +
//            "where eq1.id limit #{start},#{len}")
//    public List<CommentEntity> question(Long start, Long len);
//
//    @Select("select * from edu_view limit #{start},#{len}")
//    public List<CommentEntity> comment(Long start, Long len);
//
//    int insertQuestion()
}
