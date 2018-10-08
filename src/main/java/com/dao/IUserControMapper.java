package com.dao;


import com.entity.Easybuy_info;
import com.entity.Easybuy_user;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IUserControMapper extends IPageInfiMapper {
    // 查询管理员信息
    public List<Easybuy_info> findAll(@Param("seleuname") String seleuname) throws Exception;

    // 分页数据查询
    public List<Easybuy_user> getOnePage(@Param("pageIndex")int pageIndex,@Param("pageSize") int pageSize, @Param("seleuname")String seleuname, @Param("seleType")int seleType) throws Exception;

    // 求改前台用户冻结性
    public boolean up_user(Easybuy_user EasybuyUser) throws Exception;

    // 登录
    public boolean isLogin(Easybuy_info info) throws Exception;

    // 修改管理员密码
    public boolean up_userpwd(Easybuy_info info) throws Exception;

    // 添加管理员
    public boolean addEasybuyInfo(Easybuy_info EasybuyInfo) throws Exception;

    // 用户信息
    public Easybuy_info userinfo(String seleuname) throws Exception;

}
