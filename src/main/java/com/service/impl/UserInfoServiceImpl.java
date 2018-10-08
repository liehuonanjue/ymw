package com.service.impl;


import com.entity.Easybuy_product;
import com.entity.Easybuy_product_categoy;
import com.service.IUserInfoService;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class UserInfoServiceImpl implements IUserInfoService {


	@Override
	public List<Easybuy_product_categoy> classify_categoy(int tid, int parid) throws Exception {
		return null;
	}

	@Override
	public List<Easybuy_product_categoy> classify_categoy(int parid) throws Exception {
		return null;
	}

	@Override
	public boolean info_categoy(String uname, int parid, int type) throws Exception {
		return false;
	}

	@Override
	public boolean delete_categoy(int tid, String uname) throws Exception {
		return false;
	}

	@Override
	public Easybuy_product getUserInfoById(Integer uid) throws Exception {
		return null;
	}

	@Override
	public boolean info_product(Easybuy_product product) throws Exception {
		return false;
	}

	@Override
	public List<Easybuy_product> getOnePage(int pageIndex, int pageSize, String seleuname) throws Exception {
		return null;
	}

	@Override
	public int getTotalusers(String seleuname) throws Exception {
		return 0;
	}

	@Override
	public boolean up_categoy(Easybuy_product productUp) throws Exception {
		return false;
	}
}
