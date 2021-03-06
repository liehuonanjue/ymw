package com.service;

import java.util.List;

import com.entity.Easybuy_product;
import com.entity.Easybuy_product_categoy;
import com.entity.Easybuy_user;

/** 2018��4��28�� */
public interface IUserInfoService {
	// 三级分类方法
	public List<Easybuy_product_categoy> classify_categoy(int tid, int parid) throws Exception;

	// 分类
	public List<Easybuy_product_categoy> classify_categoy(int parid) throws Exception;

	// 添加分类
	public boolean info_categoy(String uname, int parid, int type) throws Exception;

	// 删除
	public boolean delete_categoy(int tid, String uname) throws Exception;

	// 查询单个用户信息
	public Easybuy_product getUserInfoById(Integer uid) throws Exception;

	// 添加商品
	public boolean info_product(Easybuy_product product) throws Exception;

	// 分页数据查询
	public List<Easybuy_product> getOnePage(int pageIndex, int pageSize,String seleuname) throws Exception;

	// 判断有多少数据
	public int getTotalusers(String seleuname) throws Exception;

	// 修改
	public boolean up_categoy(Easybuy_product productUp) throws Exception;
}
