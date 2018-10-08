package com.service.impl;


import com.dao.IIndentMapper;
import com.entity.Easybuy_order;
import com.entity.Easybuy_order_detail;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.service.IIndentService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class IIndentServiceImpl implements IIndentService {

    @Autowired
    public IIndentMapper iIndentMapper;

    @Override
    public int getTotalusers(String seleuname, int ord) throws Exception {
        return iIndentMapper.getTotalusers(seleuname, ord);
    }

    @Override
    public List<Easybuy_order_detail> byidpage(@Param("uid") Integer uid) throws Exception {
        return iIndentMapper.byidpage(uid);
    }

    @Override
    public PageInfo<Easybuy_order> getOnePage(String seleuname, int pageNum, int pageSize) throws Exception {
        System.out.println("sss");
        Page<Easybuy_order> page = PageHelper.startPage(pageNum, pageSize);
        iIndentMapper.getOnePage(seleuname);
        System.out.println(page.toPageInfo());
        System.out.println(seleuname);
        System.out.println(iIndentMapper.getOnePage(seleuname));

        return page.toPageInfo();

    }


    @Override
    public List<Easybuy_order> getTwoPage(int pageIndex, int pageSize, String seleuname) throws Exception {
        return iIndentMapper.getTwoPage(pageIndex, pageSize, seleuname);
    }

    @Override
    public Easybuy_order orderdetali(String seleuname) throws Exception {
        return iIndentMapper.orderdetali(seleuname);
    }

    @Override
    public boolean up_Order(Easybuy_order EasybuyOrder) throws Exception {
        return iIndentMapper.up_Order(EasybuyOrder);
    }
}
