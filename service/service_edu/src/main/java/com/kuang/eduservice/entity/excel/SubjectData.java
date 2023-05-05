package com.kuang.eduservice.entity.excel;

import com.alibaba.excel.annotation.ExcelProperty;
import io.swagger.annotations.ApiModel;
import lombok.Data;

/**
 * @Description:
 * @Author: StarSea99
 * @Date: 2020-10-12 10:09
 */
@ApiModel(value = "Subject查询数据", description = "课程分类列表")
@Data
public class SubjectData {
    @ExcelProperty(index = 0)
    private String oneSujectName;

    @ExcelProperty(index = 1)
    private String twoSujectName;
}
