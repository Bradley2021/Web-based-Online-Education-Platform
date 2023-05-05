package com.kuang.eduservice.client;

import com.kuang.common.utils.R;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @Description:
 * @Author: StarSea99
 * @Date: 2020-10-23 16:58
 */
@Component
public class VodFileDegradeFeignClient implements VodClient {
    //出错之后执行的方法
    @Override
    public R removeAliyVideo(String id) {
        return R.error().message("删除视频出错了");
    }

    @Override
    public R deleteBatch(List<String> videoIdList) {
        return R.error().message("删除视频出错了");
    }
}
