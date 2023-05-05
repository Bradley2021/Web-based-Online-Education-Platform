package com.kuang.eduservice.controller;

import com.kuang.common.utils.R;
import com.kuang.eduservice.service.EduSearchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@RestController
@RequestMapping("/eduservice/search/")
public class EduSearchController {

    @Autowired
    EduSearchService searchService;

    @GetMapping("/a_1/{index}")
    public R searchCourse(@RequestParam("q") String q,@PathVariable Integer index) throws IOException {
        return searchService.searchCourseByKeyword(q, index);
    }
}
