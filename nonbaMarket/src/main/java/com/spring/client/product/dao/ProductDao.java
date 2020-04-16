package com.spring.client.product.dao;

import java.util.List;

import com.spring.client.product.vo.Large_categoryVO;
import com.spring.client.product.vo.Mc_categoryVO;

import com.spring.client.product.vo.P_optionVO;
import com.spring.client.product.vo.ProductVO;
import com.spring.client.review.vo.ReviewVO;
import com.spring.common.vo.CommonVO;

public interface ProductDao {
	public List<ProductVO> productList(ProductVO vo);
	public List<Mc_categoryVO> mcList(String cate);
	public String lcName(String lcNum);
	public ProductVO productDetail(ProductVO gvo);
	public List<P_optionVO> productOption(P_optionVO pvo);
	public List<ProductVO> newProduct();
	public List<ProductVO> bestProduct();
	public List<ProductVO> saleProduct();
	public List<ProductVO> mainNewProduct();
	
	public List<Large_categoryVO> largeCategory();
	public List<Mc_categoryVO> midCategory(String lc_num);
	
	
	public int memberNumber(String id);
	public int reviewCheck(CommonVO cvo);
	public int reviewUpdate(String m_num);
	
	
}
