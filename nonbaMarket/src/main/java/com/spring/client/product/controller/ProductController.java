package com.spring.client.product.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.client.basket.vo.BasketVO;
import com.spring.client.bookmark.vo.BookmarkVO;
import com.spring.client.member.vo.MemberVO;
import com.spring.client.product.service.ProductService;
import com.spring.client.product.vo.Mc_categoryVO;
import com.spring.client.product.vo.P_optionVO;
import com.spring.client.product.vo.ProductVO;
import com.spring.client.product_inq.vo.Product_inqVO;
import com.spring.client.review.vo.ReviewVO;
import com.spring.common.vo.CommonVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@AllArgsConstructor
@RequestMapping(value = "/product")
@Log4j
public class ProductController {
	
	private ProductService productService;
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(MultipartFile.class,"file",new StringTrimmerEditor(true) );
	}
	
	@GetMapping(value = "/categori")
	public String productList(@ModelAttribute ProductVO pvo,Model model) {
		log.info("productList 컨트롤러 호출 성공");
		/* log.info("pvo = "+pvo); */
		
		String lcName = productService.lcName(pvo);
		String lcNum = productService.lcNum(pvo);
		/* String mcName = productService.mcName(pvo); */
		
		List<ProductVO> list = productService.productList(pvo);
		List<Mc_categoryVO> mcList = productService.mcList(pvo);
		
	
		model.addAttribute("lcNum",lcNum);
		model.addAttribute("lcName",lcName);
		model.addAttribute("mcList",mcList);
		model.addAttribute("list",list);
		/* model.addAttribute("mcName",mcName); */
		/*
		 * log.info(mcList); for(ProductVO la : list) { log.info(la); }
		 */
		return "product/productList";
	}
	@GetMapping(value = "/productDetail")
	public String productDetail(@ModelAttribute("data") ProductVO pvo ,Model model,HttpServletRequest request) {
		ProductVO vo = productService.productDetail(pvo);
		model.addAttribute("vo",vo);
		
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("user");
		if(mvo!=null) {
				session.setAttribute("id", mvo.getM_id());
				int number = productService.memberNumber(mvo.getM_id());
				model.addAttribute("m_num",number);
				
				CommonVO cvo = new CommonVO();
				cvo.setM_num(number);
				cvo.setP_num(pvo.getP_num());
				int result = productService.reviewCheck(cvo);
				
				if(result!=0) {
					session.setAttribute("reviewCheck", true);
				}else {
					session.setAttribute("reviewCheck", false);
				}			
		}else {
			session.setAttribute("reviewCheck", false);
		}
		return "product/productDetail";
	}
	@ResponseBody
	@RequestMapping(value = "/productOption", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<P_optionVO>> productOption(@ModelAttribute P_optionVO pvo){
		
		ResponseEntity<List<P_optionVO>>entity =null;
		entity = new ResponseEntity<List<P_optionVO>>(productService.productOption(pvo),HttpStatus.OK);
		/* log.info(entity); */
		return entity;
	}
	
	@GetMapping(value = "/newProduct")
	public String newProduct(Model model) {
		log.info("newProduct 호출 성공");
		List<ProductVO> list = productService.newProduct();
		model.addAttribute("list",list);
		
		/*
		 * for(ProductVO ll : list) log.info(ll);
		 */
		return "product/new_product";
	}
	@GetMapping(value = "/bestProduct")
	public String bestProduct(Model model) {
		log.info("bestProduct 호출 성공");
		
		List<ProductVO> bestList = productService.bestProduct();
		model.addAttribute("list",bestList);
		
		return "product/bestProduct";
	}
	@GetMapping(value = "/saleProduct")
	public String saleProduct(Model model) {
		log.info("saleProduct 호출 성공");
		
		List<ProductVO> saleProduct = productService.saleProduct();
		model.addAttribute("list",saleProduct);
		
		return "product/saleProduct";
	}
	
	@ResponseBody
	@GetMapping(value = "/reviewData",produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String reviewData(ReviewVO rvo) {
		log.info("reviewData 호출 성공");
		log.info("rvo = "+rvo);
		
		String listData = productService.reviewList(rvo);
		return listData;
	}
	@ResponseBody
	@GetMapping(value = "/inqData",produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String inqData(Product_inqVO rvo) {
		log.info("inqData 호출 성공");
		log.info("rvo = "+rvo);
		
		String listData = productService.product_inqList(rvo);
		return listData;
	}
	
	@ResponseBody
	@PostMapping(value = "/reviewUpdateBtn")
	public String reviewUpdate(String m_id) {
		int m_num = productService.reviewUpdate(m_id);
		
		return String.valueOf(m_num);
	}
	
	@ResponseBody
	@PostMapping(value = "/reviewDelete")
	public String reviewDelete(String re_num) {
		
		int num = productService.reviewDelete(re_num);
		String result = "";
		if(num==1) {
			result = "SUCCESS";
		}else {
			result ="FAIL";
		}
		return result;
	}
	
	
	@ResponseBody
	@PostMapping(value ="/reviewInsert",produces = "text/plain; charset=UTF-8" )
	public String reviewInsert(ReviewVO gvo) {
		log.info("reviewInsert 호출 성공");
		log.info("file name : "+gvo.getFile().getOriginalFilename());
		String value = "";
		int result = 0;
		log.info("reviewInsert"+gvo);
		result = productService.reviewInsert(gvo);
		if(result==1) {
			value = "성공";
		}else {
			value = "실패";
		}
		return value;
	}
	
	@ResponseBody
	@PostMapping(value = "/reviewUpdate", produces = "text/plain; charset=UTF-8")
	public String reviewUpdateB(ReviewVO vo) {
		log.info("reviewUpdateB 호출 성공");
		
		String value ="";
		int result= 0;
		result = productService.reviewUpdateB(vo);
		if(result==1) {
			value="성공";
		}else {
			value ="실패";
		}
		return value;
	}
	
	@ResponseBody
	@GetMapping(value = "/updateForm", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String updateForm(ReviewVO rvo) {
		log.info("updateForm 호출 성공");
		String data = productService.updataForm(rvo);
		return data;
	}
	
	@ResponseBody
	@PostMapping(value = "/productInq",produces = "text/plain; charset=UTF-8")
	public String productInq(Product_inqVO ivo) {
		log.info("productInq 호출 성공");
		log.info("ivo ="+ivo);
		String success="";
		int result = productService.productInq(ivo);
		if(result==1) {
			success = "성공";
		}else {
			success = "실패";
		}
		return success;
	}
	
	@ResponseBody
	@GetMapping(value = "/inqUpdateForm", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String inqUpdateForm(Product_inqVO ivo) {
		log.info("inqUpdateForm 호출 성공");
		String data = productService.inqUpdateForm(ivo);
		return data;
	}
	
	@ResponseBody
	@PostMapping(value = "/productInqUpdate",produces = "text/plain; charset=UTF8")
	public String productInqUpdate(Product_inqVO ivo) {
		log.info("productInqUpdate 호출 성공");
		String result = "";
		log.info("ivo="+ivo);
		int num = productService.productInqUpdate(ivo);
		if(num==1) {
			result= "성공";
		}else {
			result = "실패";
		}
		
		return result;
	}
	
	@ResponseBody
	@GetMapping(value = "/productInqDelete", produces = "text/plain; charset = UTF-8")
	public String productInqDelete(Product_inqVO ivo) {
		log.info("productInqDelete 호출 성공");
		String result = "";
		log.info("ivo="+ivo);
		int num = productService.productInqDelete(ivo);
		if(num==1) {
			result= "성공";
		}else {
			result = "실패";
		}
		
		return result;
	}
	

	@ResponseBody
	@PostMapping(value = "/goBasket", produces = "text/plain; charset=UTF-8")
	public String goBasket(BasketVO bvo,HttpServletRequest request) {
		log.info("goBasket 호출 성공");
		HttpSession session = request.getSession();
		String result = "";
		
		String id = (String)session.getAttribute("id");
		ObjectMapper mapper = new ObjectMapper();
		try {
			if(id=="") {
				String vo = mapper.writeValueAsString(bvo);
				if(session.getAttribute("basket")==null) {
				    session.setAttribute("basket", vo);
				}
				else {
					String sv= (String) session.getAttribute("basket");
				    session.setAttribute("basket", sv+vo);
				}
				result = "성공";
				log.info("session:"+session.getAttribute("basket"));
			}else {
				int num = productService.goBasket(bvo);
				if(num==1) {
					result= "성공";
				}else {
					result = "실패";
				}
				
			}
		}catch(JsonProcessingException e) {
			e.printStackTrace();
		}
		
		
		return result;
		
	}
	
	
	@ResponseBody
	@PostMapping(value = "/productEnjoy", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String productEnjoy(BookmarkVO vo) {
		log.info("productEnjoy 호출 성공");
		
		String data = productService.productEnjoy(vo);
		return data;
	}
	
	@ResponseBody
	@PostMapping(value ="/bookMarkInsert" , produces = "text/plain; charset=UTF-8")
	public String bookMarkInsert(BookmarkVO vo) {
		log.info("bookMark 호출 성공");
		
		String data = "";
		int num = productService.bookMarkInsert(vo);
		if(num==1) {
			data="성공";
		}else {
			data= "실패";
		}
		return data;
	}
	@ResponseBody
	@PostMapping(value ="/bookMarkInsert2" , produces = "text/plain; charset=UTF-8")
	public String bookMarkInsert2(BookmarkVO vo) {
		log.info("bookMark 호출 성공");
		
		String data = "";
		int num = productService.bookMarkInsert2(vo);
		if(num==1) {
			data="성공";
		}else {
			data= "실패";
		}
		return data;
	}
	
	@ResponseBody
	   @PostMapping(value = "/cntUpdate", produces = "text/plain; charset=UTF-8")
	   public String cntUpdate(String re_num,HttpServletRequest request,HttpServletResponse response) {
	      String data = "";
	       Cookie[] cookies = request.getCookies();
	           
	           // 비교하기 위해 새로운 쿠키
	           Cookie viewCookie = null;
	    
	           // 쿠키가 있을 경우 
	           if (cookies != null && cookies.length > 0) 
	           {
	               for (int i = 0; i < cookies.length; i++)
	               {
	                   // Cookie의 name이 cookie + reviewNo와 일치하는 쿠키를 viewCookie에 넣어줌 
	                   if (cookies[i].getName().equals("cookie"+re_num))
	                   { 
	                       System.out.println("처음 쿠키가 생성한 뒤 들어옴.");
	                       viewCookie = cookies[i];
	                   }
	               }
	           }
	           
	           if (re_num != null) {
	               System.out.println("System - 해당 상세 리뷰페이지로 넘어감");
	    
	               // 만일 viewCookie가 null일 경우 쿠키를 생성해서 조회수 증가 로직을 처리함.
	               if (viewCookie == null) {    
	                   System.out.println("cookie 없음");
	                   
	                   // 쿠키 생성(이름, 값)
	                   Cookie newCookie = new Cookie("cookie"+re_num, "|" + re_num + "|");
	                                   
	                   // 쿠키 추가
	                   response.addCookie(newCookie);
	    
	                   // 쿠키를 추가 시키고 조회수 증가시킴
	                   int result = productService.cntUpdate(re_num);
	                   
	                   if(result>0) {
	                       System.out.println("조회수 증가");
	                   }else {
	                       System.out.println("조회수 증가 에러");
	                   }
	               }
	               // viewCookie가 null이 아닐경우 쿠키가 있으므로 조회수 증가 로직을 처리하지 않음.
	               else {
	                   System.out.println("cookie 있음");
	                   
	                   // 쿠키 값 받아옴.
	                   String value = viewCookie.getValue();
	                   
	                   System.out.println("쿠키값 :"+value);
	               }
	        }
	           data = productService.reviewCnt2(re_num);
	           return data;
	   }

}
