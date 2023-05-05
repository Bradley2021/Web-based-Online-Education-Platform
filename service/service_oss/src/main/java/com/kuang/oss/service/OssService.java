package com.kuang.oss.service;

import org.springframework.web.multipart.MultipartFile;

/**
 * @Description:
 * @Author: StarSea99
 * @Date: 2020-10-08 13:21
 */
public interface OssService {
    //上传头像到oss中
    String uploadFileAvator(MultipartFile file);
}
