package com.spring.client.product.service;

import java.util.List;

import com.spring.client.basket.vo.BasketVO;
import com.spring.client.bookmark.vo.BookmarkVO;
import com.spring.client.product.vo.Large_categoryVO;
import com.spring.client.product.vo.Mc_categoryVO;
import com.spring.client.product.vo.P_optionVO;
import com.spring.client.product.vo.ProductVO;
import com.spring.client.product_inq.vo.Product_inqVO;
import com.spring.client.review.vo.ReviewVO;
import com.spring.common.vo.CommonVO;

public interface ProductService {
	public List<ProductVO> productList(ProductVO gvo);
	public List<Mc_categoryVO> mcList(ProductVO gvo);
	public String lcName(ProductVO gvo);
	public ProductVO productDetail(ProductVO gvo);
	public List<P_optionVO> productOption(P_optionVO pvo);
	public String lcNum(ProductVO gvo);
	public List<ProductVO> newProduct();
	public List<ProductVO> bestProduct();
	public List<ProductVO> saleProduct();
	public List<ProductVO> mainNewProduct();
	
	public List<Large_categoryVO> largeCategory();
	public List<Mc_categoryVO> midCategory(String lc_num);
	
	public String reviewList(ReviewVO rvo);
	
	public String product_inqList(Product_inqVO vo);
	
	
	
	public int memberNumber(String id);
	public int reviewCheck(CommonVO vo);
	public int reviewUpdate(String m_num);
	public int reviewDelete(String re_num);
	public int reviewInsert(ReviewVO rvo);
	public int reviewUpdateB(ReviewVO rvo);
	public String updataForm(ReviewVO rvo);
	
	
	
	public int productInq(Product_inqVO ivo);
	public String inqUpdateForm(Product_inqVO ivo);
	public int productInqUpdate(Product_inqVO ivo);
	public int productInqDelete(Product_inqVO ivo);
	
	
	
	public int goBasket(BasketVO bvo);
	
	
	public String productEnjoy(BookmarkVO bvo);
	public int bookMarkInsert(BookmarkVO bvo);
	public int bookMarkInsert2(BookmarkVO bvo);
	
	public int cntUpdate(String re_num);
    public String reviewCnt2(String re_num);
}
