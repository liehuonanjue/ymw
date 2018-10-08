package com.service;


import com.entity.Easybuy_order;
import com.entity.Easybuy_order_detail;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface IIndentService {
    // 获取有多少数据
    public int getTotalusers(String seleuname, int ord) throws Exception;

    // 查询订单
    public List<Easybuy_order_detail> byidpage(Integer uid) throws Exception;

    // 分页订单表
public PageInfo<Easybuy_order> getOnePage(String seleuname, int pageNum, int pageSize) throws Exception;

    // 完成的订单
    public List<Easybuy_order> getTwoPage(int pageIndex, int pageSize, String seleuname) throws Exception;

    // 订单用户信息
    public Easybuy_order orderdetali(String seleuname) throws Exception;

    // 订单的状态
    public boolean up_Order(Easybuy_order EasybuyOrder) throws Exception;
}
