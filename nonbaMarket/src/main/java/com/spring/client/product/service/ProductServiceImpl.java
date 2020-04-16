package com.spring.client.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.client.basket.dao.BasketDao;
import com.spring.client.basket.vo.BasketVO;
import com.spring.client.bookmark.dao.BookmarkDao;
import com.spring.client.bookmark.vo.BookmarkVO;
import com.spring.client.product.dao.ProductDao;
import com.spring.client.product.vo.Large_categoryVO;
import com.spring.client.product.vo.Mc_categoryVO;
import com.spring.client.product.vo.P_optionVO;
import com.spring.client.product.vo.ProductVO;
import com.spring.client.product_inq.dao.Product_inqDao;
import com.spring.client.product_inq.vo.Product_inqVO;
import com.spring.client.review.dao.ReviewDao;
import com.spring.client.review.vo.ReviewVO;
import com.spring.common.file.FileUploadUtil;
import com.spring.common.vo.CommonVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ProductServiceImpl implements ProductService {
	
	@Setter(onMethod_ = @Autowired)
	private ProductDao productDao;

	@Setter(onMethod_ = @Autowired)
	private ReviewDao reviewDao;
	
	
	@Setter(onMethod_ =@Autowired )
	private Product_inqDao product_inqDao;
	
	@Setter(onMethod_ = @Autowired)
	private BasketDao basketDao;
	
	@Setter(onMethod_ = @Autowired)
	private BookmarkDao bookMarkDao;
	/***************
	 * 클릭했을때 리스트 불러오기
	 ***************/
	@Override
	public List<ProductVO> productList(ProductVO gvo) {
		log.info("productList 서비스 호출 성공");
		List<ProductVO> list = productDao.productList(gvo);
		return list;
	}
	/***************
	 * 중분류 이름 뽑아오기
	 ***************/
	@Override
	public List<Mc_categoryVO> mcList(ProductVO gvo) {
		List<Mc_categoryVO> mcList;
		String result = "";
		int lcNum = gvo.getLc_num();
		if(lcNum==0) {
			if(String.valueOf(gvo.getMc_num()).length()==7) {
	            result = String.valueOf(gvo.getMc_num()).substring(0,4);
	         }else {
	            result = String.valueOf(gvo.getMc_num()).substring(0,3);
	         }
			mcList = productDao.mcList(result);
		}else {
			mcList = productDao.mcList(String.valueOf(lcNum));
		}
		return mcList;
	}
	
	/*****************
	 * 대분류 이름 뽑아오기
	 *****************/
	@Override
	public String lcName(ProductVO gvo) {
		String name = null;
		int lcNum = gvo.getLc_num();
		String result ="";
		if(lcNum==0) {
			if(String.valueOf(gvo.getMc_num()).length()==7) {
	            result = String.valueOf(gvo.getMc_num()).substring(0,4);
	         }else {
	            result = String.valueOf(gvo.getMc_num()).substring(0,3);
	         }
			
			name = productDao.lcName(result);
		}else {
			name = productDao.lcName(String.valueOf(lcNum));
		}
		return name;
	}
	/*****************
	 * 전체 뽑아오기
	 *****************/
	
	@Override
	public String lcNum(ProductVO gvo) {
		/* String num = null; */
		String result = "";
		int lcNum = gvo.getLc_num();
		if(lcNum==0) {
			if(String.valueOf(gvo.getMc_num()).length()==7) {
	            result = String.valueOf(gvo.getMc_num()).substring(0,4);
	         }else {
	            result = String.valueOf(gvo.getMc_num()).substring(0,3);
	         }
			
			return result;
			/* num = productDao.lcNum(Integer.parseInt(result)); */
		}else {
			/* num = productDao.lcNum(lcNum); */
			return String.valueOf(lcNum);
		}
	}
	@Override
	public ProductVO productDetail(ProductVO gvo) {
		ProductVO vo = productDao.productDetail(gvo);
		return vo;
	}
	@Override
	public List<P_optionVO> productOption(P_optionVO pvo) {
		List<P_optionVO> list = productDao.productOption(pvo);
		return list;
	}
	@Override
	public List<ProductVO> newProduct() {
		List<ProductVO> list = productDao.newProduct();
		
		return list;
	}
	@Override
	public List<ProductVO> bestProduct() {
		List<ProductVO> list = productDao.bestProduct();
		
		return list;
	}
	@Override
	public List<ProductVO> saleProduct() {
		List<ProductVO> list = productDao.saleProduct();
		
		return list;
	}
	@Override
	public List<ProductVO> mainNewProduct() {
		List<ProductVO> list = productDao.mainNewProduct();
		
		return list;
	}
	@Override
	public List<Large_categoryVO> largeCategory() {
		List<Large_categoryVO> list = productDao.largeCategory();
		return list;
	}
	@Override
	public List<Mc_categoryVO> midCategory(String lc_num) {
		List<Mc_categoryVO> list = productDao.midCategory(lc_num);
		return list;
	}
	
	@Override
	public String reviewList(ReviewVO rvo) {
		List<ReviewVO> list =null;
		ObjectMapper mapper = new ObjectMapper();
		String listData="";
		try {
			int re_count = reviewDao.reviewListCnt(rvo);
			int pageNum = (rvo.getPageNum()==0? 1: rvo.getPageNum());
			int amount = (rvo.getAmount()==0? 0:rvo.getAmount());
			
			log.info("re_count="+re_count+"/pageNum="+pageNum+"/amount="+amount);
			list = reviewDao.reviewList(rvo);
			if(!list.isEmpty()) {
				list.get(0).setRe_count(re_count);
				list.get(0).setPageNum(pageNum);
				list.get(0).setAmount(amount);
			}
			
			listData = mapper.writeValueAsString(list);
			log.info(listData);
		}catch(JsonProcessingException e) {
			e.printStackTrace();
		}
		return listData;
	}
	@Override
	public String product_inqList(Product_inqVO vo) {
		List<Product_inqVO> list =null;
		ObjectMapper mapper = new ObjectMapper();
		String listData="";
		try {
			int inq_count = product_inqDao.inqListCnt(vo);
			int pageNum = (vo.getPageNum()==0? 1: vo.getPageNum());
			int amount = (vo.getAmount()==0? 0:vo.getAmount());
			
			log.info("re_count="+inq_count+"/pageNum="+pageNum+"/amount="+amount);
			list =  product_inqDao.inqList(vo);
			if(!list.isEmpty()) {
				list.get(0).setInq_count(inq_count);
				list.get(0).setPageNum(pageNum);
				list.get(0).setAmount(amount);
			}
			
			listData = mapper.writeValueAsString(list);
			log.info(listData);
		}catch(JsonProcessingException e) {
			e.printStackTrace();
		}
		return listData;
	}
	@Override
	public int memberNumber(String id) {
		int num = productDao.memberNumber(id);
		return num;
	}
	@Override
	public int reviewCheck(CommonVO cvo) {
		int cnt = productDao.reviewCheck(cvo);
		return cnt;
	}
	@Override
	public int reviewUpdate(String m_num) {
		int num = productDao.reviewUpdate(m_num);
		return num;
	}
	@Override
	public int reviewDelete(String re_num) {
		int num = reviewDao.reviewDelete(re_num);
		
		return num;
	}
	@Override
	public int reviewInsert(ReviewVO rvo) {
		int result = 0;
		try {
			if(rvo.getFile()!=null) {
				String fileName = FileUploadUtil.fileUpload(rvo.getFile(), "review");
				rvo.setRe_img(fileName);
				
				
			
			}
			result = reviewDao.reviewInsert(rvo);
		}catch(Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}
	
	@Override
	public int reviewUpdateB(ReviewVO rvo) {
		int result = 0;
		try {
			if(rvo.getFile()!=null) {
				if(!rvo.getRe_img().isEmpty()) {
					FileUploadUtil.fileDelete(rvo.getRe_img());
					
				}
				String fileName = FileUploadUtil.fileUpload(rvo.getFile(),"gallery");
				rvo.setRe_img(fileName);
				
				
			}else {
				rvo.setRe_img("");	
			}
			result = reviewDao.reviewUpdateB(rvo);
		}catch(Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}
	@Override
	public String updataForm(ReviewVO rvo) {
		String data = "";
		ReviewVO vo = reviewDao.updateForm(rvo);
		try{
			ObjectMapper mapper = new ObjectMapper();
			data = mapper.writeValueAsString(vo);
		}catch(JsonProcessingException e) {
			e.printStackTrace();
		}
		return data;
	}
	@Override
	public int productInq(Product_inqVO ivo) {
		int result = product_inqDao.productInq(ivo);
		
		return result;
	}
	
	@Override
	public String inqUpdateForm(Product_inqVO ivo) {
		String data = "";
		Product_inqVO vo = product_inqDao.inqUpdateForm(ivo);
		try {
			ObjectMapper mapper = new ObjectMapper();
			data = mapper.writeValueAsString(vo);
		}catch(JsonProcessingException e) {
			e.printStackTrace();
		}
		return data;
	}
	@Override
	public int productInqUpdate(Product_inqVO ivo) {
		int num = product_inqDao.productInqUpdate(ivo);
		
		return num;
	}
	@Override
	public int productInqDelete(Product_inqVO ivo) {
		int num = product_inqDao.productInqDelete(ivo);
		return num;
	}
	@Override
	public int goBasket(BasketVO bvo) {
		int num = basketDao.goBasket(bvo);
		return num;
	}
	
	@Override
	public String productEnjoy(BookmarkVO vo) {
		List<BookmarkVO> bvo = bookMarkDao.productEnjoy(vo);
		String data ="";
		try {
			ObjectMapper mapper = new ObjectMapper();
			data = mapper.writeValueAsString(bvo);
		}catch(JsonProcessingException e) {
			e.printStackTrace();
		}
		return data;
	}
	@Override
	public int bookMarkInsert(BookmarkVO bvo) {
		int num = bookMarkDao.bookMarkInsert(bvo);
		return num;
	}
	@Override
	public int bookMarkInsert2(BookmarkVO bvo) {
		int num = bookMarkDao.bookMarkInsert2(bvo);
		return num;
	}
	
	@Override
	   public int cntUpdate(String re_num) {
	      int result = reviewDao.cntUpdate(re_num);
	      return result;
	   }
	   @Override
	   public String reviewCnt2(String re_num) {
	      String num = reviewDao.reviewCnt2(re_num);
	      return num;
	   }
	
}
