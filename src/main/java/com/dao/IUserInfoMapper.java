package com.dao;

import java.util.List;

import com.entity.Easybuy_product;
import com.entity.Easybuy_product_categoy;
import org.springframework.stereotype.Repository;


@Repository
public interface IUserInfoMapper {

    // 三级分类
    public List<Easybuy_product_categoy> classify_categoy(int tid, int parid) throws Exception;

    // 分类
    public List<Easybuy_product_categoy> classify_categoy(int parid) throws Exception;

    // 添加分类
    public boolean info_categoy(String uname, int parid, int type) throws Exception;

    // 删除
    public boolean delete_categoy(int tid, String uname) throws Exception;

    // 修改
    public boolean up_categoy(Easybuy_product productUp) throws Exception;

    // 查询单个用户信息
    public Easybuy_product getUserInfoById(Integer uid) throws Exception;

    // 添加商品
    public boolean info_product(Easybuy_product product) throws Exception;

    // 分页数据查询
    public List<Easybuy_product> getOnePage(int pageIndex, int pageSize, String seleuname) throws Exception;

}
