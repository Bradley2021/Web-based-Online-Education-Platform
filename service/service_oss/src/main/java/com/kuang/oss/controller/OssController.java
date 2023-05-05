package com.kuang.oss.controller;

import com.kuang.common.utils.R;
import com.kuang.oss.service.OssService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

/**
 * @Description:
 * @Author: StarSea99
 * @Date: 2020-10-08 13:21
 */
@Api(description="阿里云文件管理")
@RestController
@RequestMapping("/eduoss/fileoss")
//@CrossOrigin
public class OssController {

    @Autowired
    private OssService ossService;

    @ApiOperation(value = "文件上传")
    @PostMapping
    public R uploadOssFile(@ApiParam(name = "file", value = "文件", required = true)
                            @RequestParam("file") MultipartFile file){
        //返回上传到oss的路径
        String url = ossService.uploadFileAvator(file);
        return R.ok().data("url",url);
    }
}
