package com.spring.client.product_inq.dao;

import java.util.List;

import com.spring.client.product_inq.vo.Product_inqVO;

public interface Product_inqDao {
	public List<Product_inqVO> inqList(Product_inqVO vo);
	
	public int inqListCnt(Product_inqVO vo);
	public int productInq(Product_inqVO ivo);
	public Product_inqVO inqUpdateForm(Product_inqVO ivo);
	public int productInqUpdate(Product_inqVO ivo);
	public int productInqDelete(Product_inqVO ivo);
	
	
	public int inq_ListCnt(Product_inqVO ivo);
	public List<Product_inqVO> inqList2(Product_inqVO ivo);
}
