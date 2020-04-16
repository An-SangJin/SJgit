package com.spring.client.orders.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.client.basket.service.BasketService;
import com.spring.client.basket.vo.BasketVO;
import com.spring.client.card.service.CardService;
import com.spring.client.card.vo.CardVO;
import com.spring.client.detail.service.DetailService;
import com.spring.client.detail.vo.DetailVO;
import com.spring.client.issue_coupon.service.Issue_couponService;
import com.spring.client.issue_coupon.vo.Issue_couponVO;
import com.spring.client.member.service.MemberService;
import com.spring.client.member.vo.MemberVO;
import com.spring.client.orders.service.OrdersService;
import com.spring.client.orders.vo.OrdersVO;
import com.spring.client.pointstatus.service.PointStatusService;
import com.spring.client.pointstatus.vo.PointStatusVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping(value="/orders/*")
@Log4j
@AllArgsConstructor
public class OrdersController {
	
	private OrdersService ordersService;
	
	private MemberService memberService;
	private Issue_couponService issue_couponService;
	private BasketService basketService;
	private CardService cardService;
	private PointStatusService pointStatusService;
	
	private DetailService detailService;
	
	
	
	
	@GetMapping(value = "/ordersForm") 
	public String orderForm(@ModelAttribute("data") BasketVO bvo, MemberVO mvo, Issue_couponVO ivo, CardVO cvo, Model model,HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO) session.getAttribute("user");
		
		if(vo!=null) {
			
			mvo.setM_num(vo.getM_num());
			bvo.setM_num(vo.getM_num());
			ivo.setM_num(vo.getM_num());
			
			List<BasketVO> bList = basketService.basketList(bvo);
			log.info("bList : "+bList);
			MemberVO mData = memberService.memberData(mvo);
			
			List<Issue_couponVO> iList = issue_couponService.couponList2(ivo);
			
			
			
			BasketVO total = basketService.basketTotalList(bvo);
			
			List<CardVO> cList = cardService.cardData(cvo);
			
			
			model.addAttribute("basketList", bList);
			model.addAttribute("member", mData);
			model.addAttribute("issue", iList);
			model.addAttribute("total", total);
			model.addAttribute("cardList", cList);
			
		}
		
		return "orders/ordersForm";
	}
	
	@ResponseBody
	@GetMapping(value = "/cardPay")
	public String cardPay(@ModelAttribute("data") CardVO cvo, Model model) {
		
		int result = 0;
		
		result = cardService.cardCheck(cvo);
		
		return String.valueOf(result);
	}
	
	@ResponseBody
	@GetMapping(value = "/phonePay")
	public String phonePay(@ModelAttribute("data") MemberVO mvo, Model model) {
		
		int result = 0;
		
		result = memberService.phoneCheck2(mvo);
		
		return String.valueOf(result);
	}
	
	@ResponseBody
	@PostMapping(value = "/ordersFunction")
	public String ordersFunction(@ModelAttribute("data") OrdersVO ovo, BasketVO bvo, Issue_couponVO ivo, PointStatusVO pvo, MemberVO mvo,Model model,HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session.getAttribute("orderNumber")!=null) {
			session.removeAttribute("orderNumber");
		}
		int result = 0;
		int basket = 0;
		int issue = 1;
		int point = 0;
		int member = 0;
		int success = 0;
		log.info("ovo : "+ovo);
		log.info("bvo : "+bvo);
		log.info(ivo);
		log.info(pvo);
		log.info(mvo);
		result = ordersService.ordersInsert(ovo);
		
		basket = basketService.basketAllDelete(bvo);
		
		log.info("result :"+result);
		OrdersVO oData = null;
		if(ovo.getI_num()!=0) {
			oData = ordersService.ordersData(ovo); 
		}
		  if(oData != null) { 
			issue = issue_couponService.couponUpdate(ivo);
		  }
		  
		  point = pointStatusService.pointInsert(pvo);
		  
		  member = memberService.memberUpdate2(mvo);
		  
		  success = basket + issue + point + member;
		  log.info(basket);
		  log.info(issue);
		  log.info(point);
		  log.info(member);
		  
		  if(success >= 4) { 
			  success = result;
		  }else {
			  success = 0;
		  }
		  
		  log.info(result);
		
		return String.valueOf(success);
	}

	
	@RequestMapping(value="/ordersComplete")
	public String ordersComplete(OrdersVO ovo, Model model,DetailVO dvo,HttpServletRequest request) {
		log.info("ordersComplete 호출 성공");
		log.info("ovo :" + ovo);
		log.info("dvo : "+ dvo);
		HttpSession session = request.getSession();
		if(session.getAttribute("orderNumber")==null) {
			session.setAttribute("orderNumber",ovo.getO_num());
			List<OrdersVO> oList = null;
			
			oList = ordersService.ordersList(ovo);
			
			if(dvo.getList()!=null) {
				for(DetailVO vo : dvo.getList()) {
					vo.setO_num(ovo.getO_num());
					detailService.insertDetail(vo);
				}
				
			}
			
			model.addAttribute("orders", oList);
			
			return "orders/orderscomplete";
		}
		else {
			return "/";
		}
		
		
	}
}
