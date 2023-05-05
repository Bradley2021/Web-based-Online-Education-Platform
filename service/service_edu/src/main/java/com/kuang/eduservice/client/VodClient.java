package com.kuang.eduservice.client;

import com.kuang.common.utils.R;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * @Description:
 * @Author: StarSea99
 * @Date: 2020-10-22 20:58
 */
@FeignClient(name = "service-vod",fallback = VodFileDegradeFeignClient.class)
@Component
public interface VodClient {

    //定义调用的方法路径
    //根据视频id删除阿里云视频
    //@PathVariable 注解一定要指定参数名称，否则会报错
    @DeleteMapping("/eduvod/video/removeAliyVideo/{id}")
    public R removeAliyVideo(@PathVariable("id") String id);

    //删除多个阿里云视频
    @DeleteMapping("/eduvod/video/deleteBatch")
    public R deleteBatch(@RequestParam("videoIdList") List<String> videoIdList);
}
