package com.kuang.educms.service;

import com.kuang.educms.entity.CrmBanner;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 * 首页banner表 服务类
 * </p>
 *
 * @author testjava
 * @since 2020-10-24
 */
public interface CrmBannerService extends IService<CrmBanner> {

    /**
     * 查询所有轮播图
     * @return
     */
    List<CrmBanner> selectBanner();
}
