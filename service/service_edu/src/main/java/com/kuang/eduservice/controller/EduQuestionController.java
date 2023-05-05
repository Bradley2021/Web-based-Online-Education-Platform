package com.kuang.eduservice.controller;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.kuang.common.utils.R;
import com.kuang.common.utils.commentvo.UcenterMemberVo;
import com.kuang.eduservice.client.UcenterClient;
import com.kuang.eduservice.entity.CommentEntity;
import com.kuang.eduservice.entity.CourseEntity;
import com.kuang.eduservice.entity.vo.QuestionVo;
import com.kuang.eduservice.mapper.EduCommentEntity;
import com.kuang.eduservice.mapper.EduQuestionMapper;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.xml.stream.events.Comment;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/eduservice/qu")
public class EduQuestionController {

    @Autowired
    EduCommentEntity entity; //查询评论

    @Autowired
    EduQuestionMapper mapper;

    @Qualifier("com.kuang.eduservice.client.UcenterClient")
    @Autowired
    UcenterClient client;

    @RequestMapping("/get/{start}/{len}")
    public R getAllController(@PathVariable("start") Long start,@PathVariable("len") Long len){
        Page<CourseEntity> page = new Page<>(start, len);
        IPage<CourseEntity> courseEntityIPage = mapper.selectPage(page, new QueryWrapper<>());
        List<CourseEntity> records = courseEntityIPage.getRecords();

        List<QuestionVo> questionVos = new ArrayList<>();
        records.forEach(a->{
            QuestionVo vo = new QuestionVo();
            BeanUtils.copyProperties(a, vo);
            UcenterMemberVo infoUc = client.getInfoUc(a.getSubmitUser()+"");
            vo.setUser(infoUc);
            questionVos.add(vo);
        });

//        List<CommentEntity> ce = new ArrayList<>();
//        Map<Long,List<CommentEntity>> map = new HashMap<>();
//        cur.stream().forEach( a ->{
//            List<CommentEntity> a1 = entity.selectList(new QueryWrapper<CommentEntity>().eq("post_id",a));
//            map.put(a, a1);
//        });
        Map<String, Object> m = new HashMap<>();
        m.put("data", questionVos);
        return R.ok().data(m);
    }

    @RequestMapping("/comment/{id}")
    public R aaa(@PathVariable("id") Long id){
        List<CommentEntity> a1 = entity.selectList(new QueryWrapper<CommentEntity>().eq("post_id",id));
        Map<String, Object> m = new HashMap<>();
        m.put("data", a1);
        return R.ok().data(m);
    }

    @RequestMapping("/add")
    public R add1(@RequestBody CourseEntity entity){
        mapper.insert(entity);
        return R.ok();
    }

    @RequestMapping("/add1") //添加评论
    public R add2(@RequestBody CommentEntity entity1){

        entity.insert(entity1);
        return R.ok();
    }

    @RequestMapping("/hot")
    public R hot(){
        Page<CommentEntity> page = new Page<>(1,10);
        QueryWrapper<CommentEntity> wrapper = new QueryWrapper<>();
        IPage<CommentEntity> mapIPage = entity.selectPage(page, wrapper.groupBy("post_id")
                .select("post_id", "COUNT(*) as p")
                .orderByDesc("p")
                .last("LIMIT 10"));

        List<CommentEntity> records = mapIPage.getRecords();
        if(records == null ||records.size() == 0){
            return R.ok();
        }
        List<Long> postId = records.stream().map(CommentEntity::getPostId).collect(Collectors.toList());
        List<CourseEntity> id = mapper.selectList(new QueryWrapper<CourseEntity>().in("id", postId));


        Map<String,Object> res = new HashMap<>();
        res.put("data", id);
        return R.ok().data(res);
    }

    @RequestMapping("/user")
    public R user(){
        Page<CommentEntity> page = new Page<>(1,10);
        QueryWrapper<CommentEntity> wrapper = new QueryWrapper<>();
        IPage<CommentEntity> user = entity.selectPage(page, wrapper.groupBy("submit_user")
                .select("submit_user", "COUNT(*) as p")
                .orderByDesc("p")
                .last("LIMIT 10"));

        List<Long> user_id = user.getRecords().stream().map(CommentEntity::getSubmitUser).collect(Collectors.toList());
        List<UcenterMemberVo> userList = new ArrayList<>();
        user_id.stream().forEach(a->{
            UcenterMemberVo infoUc = client.getInfoUc(a + "");
            userList.add(infoUc);
        });
        return R.ok().data("data", userList);
    }
}
