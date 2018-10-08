package com.service;

import java.util.List;

import com.entity.Easybuy_info;
import com.entity.Easybuy_user;

public interface IUserControService {
	// 查询用户所有信息
	public List<Easybuy_info> findAll(String seleuname) throws Exception;

	// 分页数据查询
	public List<Easybuy_user> getOnePage(int pageIndex, int pageSize, String seleuname, int seleType) throws Exception;

	// 判断有多少数据
	public int getTotalusers(String seleuname) throws Exception;

	// 修改
	public boolean up_user(Easybuy_user EasybuyUser) throws Exception;

	// 登陆
	public boolean isLogin(Easybuy_info info) throws Exception;

	// 修改管理员密码
	public boolean up_userpwd(Easybuy_info info) throws Exception;

	// 添加管理员
	public boolean addEasybuyInfo(Easybuy_info EasybuyInfo) throws Exception;

	// 用户信息
	public Easybuy_info userinfo(String seleuname) throws Exception;

}
