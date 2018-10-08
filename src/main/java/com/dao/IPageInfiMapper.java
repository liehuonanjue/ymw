package com.dao;

import org.apache.ibatis.annotations.Param;

public interface IPageInfiMapper {


    // 获取有多少数据
    public int getTotalusers(@Param("seleuname") String seleuname) throws Exception;

}
