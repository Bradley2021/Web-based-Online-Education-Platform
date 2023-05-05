package com.kuang.staservice.service;

import com.kuang.staservice.entity.StatisticsDaily;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.Map;

/**
 * <p>
 * 网站统计日数据 服务类
 * </p>
 *
 * @author testjava
 * @since 2020-11-03
 */
public interface StatisticsDailyService extends IService<StatisticsDaily> {

    //统计某一天注册人数,生成统计数据
    void registerCount(String day);

    //图表显示，返回两个部分数据，日期json数组，数量json数据
    Map<String,Object> getShowData(String type, String begin, String end);
}
