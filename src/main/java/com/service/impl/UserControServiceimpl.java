package com.service.impl;

import java.util.List;

import com.dao.IUserControMapper;
import com.entity.Easybuy_info;
import com.entity.Easybuy_user;
import com.service.IUserControService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserControServiceimpl implements IUserControService {


    @Autowired
    public IUserControMapper iUserControMapper;

    @Override
    public List<Easybuy_info> findAll(String seleuname) throws Exception {
        return iUserControMapper.findAll(seleuname);
    }

    @Override
    public List<Easybuy_user> getOnePage(int pageIndex, int pageSize, String seleuname, int seleType) throws Exception {
        return iUserControMapper.getOnePage(pageIndex, pageSize, seleuname, seleType);
    }

    @Override
    public int getTotalusers(String seleuname) throws Exception {
        return iUserControMapper.getTotalusers(seleuname);
    }

    @Override
    public boolean up_user(Easybuy_user EasybuyUser) throws Exception {
        return iUserControMapper.up_user(EasybuyUser);
    }

    @Override
    public boolean isLogin(Easybuy_info info) throws Exception {
        return iUserControMapper.isLogin(info);
    }

    @Override
    public boolean up_userpwd(Easybuy_info info) throws Exception {
        return iUserControMapper.up_userpwd(info);
    }

    @Override
    public boolean addEasybuyInfo(Easybuy_info EasybuyInfo) throws Exception {
        return iUserControMapper.addEasybuyInfo(EasybuyInfo);
    }

    @Override
    public Easybuy_info userinfo(String seleuname) throws Exception {
        return iUserControMapper.userinfo(seleuname);
    }
}
