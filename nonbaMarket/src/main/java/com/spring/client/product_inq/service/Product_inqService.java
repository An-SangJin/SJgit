package com.spring.client.product_inq.service;

import java.util.List;

import com.spring.client.product_inq.vo.Product_inqVO;



public interface Product_inqService {
	
	public List<Product_inqVO> inqList2(Product_inqVO ivo);
	
	//페이징
	public int inq_ListCnt(Product_inqVO ivo);

}
