package com.service;

public interface IAmountService {
	// 用户数量
	public int userCount() throws Exception;
	// 商品数量
	public int commodityCount() throws Exception;
	// 未签收数量
	public int unreceiptedCount() throws Exception;
	// 签收数量
	public int signForCount() throws Exception;
	// 总金额
	public double grossCount() throws Exception;

}
