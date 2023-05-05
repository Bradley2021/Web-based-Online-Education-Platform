package com.kuang.educms.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.kuang.educms.entity.CrmBanner;
import com.kuang.educms.mapper.CrmBannerMapper;
import com.kuang.educms.service.CrmBannerService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 首页banner表 服务实现类
 * </p>
 *
 * @author testjava
 * @since 2020-10-24
 */
@Service
public class CrmBannerServiceImpl extends ServiceImpl<CrmBannerMapper, CrmBanner> implements CrmBannerService {

    /**
     * 查询所有轮播图，并存入缓存中做为热数据
     * @return
     */
    @Cacheable(value = "banner",key = "'selectIndexList'")//存放在缓存中
    @Override
    public List<CrmBanner> selectBanner() {
        //根据id进行降序排序，显示排列后前两条记录
        QueryWrapper wrapper = new QueryWrapper();
        wrapper.orderByAsc("sort");
        List<CrmBanner> list = baseMapper.selectList(wrapper);
        return list;
    }
}
