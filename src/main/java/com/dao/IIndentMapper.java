package com.dao;


import com.entity.Easybuy_order;
import com.entity.Easybuy_order_detail;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IIndentMapper {

    // 查询订单
    public List<Easybuy_order_detail> byidpage(@Param("uid") Integer uid) throws Exception;

    // 分页订单表
    public List<Easybuy_order> getOnePage(@Param("seleuname") String seleuname) throws Exception;

    // 完成的订单
    public List<Easybuy_order> getTwoPage(@Param("pageIndex") int pageIndex, @Param("pageSize") int pageSize, @Param("seleuname") String seleuname) throws Exception;

    // 订单用户信息
    public Easybuy_order orderdetali(String seleuname) throws Exception;

    // 订单的状态
    public boolean up_Order(Easybuy_order EasybuyOrder) throws Exception;

    // 获取有多少数据
    public int getTotalusers(@Param("seleuname") String seleuname, @Param("ord") int ord) throws Exception;

}
