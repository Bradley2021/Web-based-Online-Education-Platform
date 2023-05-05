package com.kuang.vod.service;

import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * @Description:
 * @Author: StarSea99
 * @Date: 2020-10-22 10:53
 */
public interface VodService {
    String uploadAlyiVideo(MultipartFile file);

    void removeMoreAlyVideo(List videoIdList);
}
