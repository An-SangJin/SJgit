package com.spring.client.basket.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.client.basket.service.BasketService;
import com.spring.client.basket.vo.BasketVO;
import com.spring.client.bookmark.vo.BookmarkVO;
import com.spring.client.member.vo.MemberVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/basket/*")
@Log4j
@AllArgsConstructor
public class BasketController {
	
	private BasketService basketService;
	
	@ResponseBody
	@PostMapping(value="/addBasket",produces = "text/plain; charset=UTF-8")
	public String addBasket(BookmarkVO bvo) {
		log.info("addBasket 호출 성공");
		log.info("bvo : "+bvo);
		int result = basketService.addBasket(bvo);
		
		if(result == 1) {
			return "SUCCESS";
		}
		else {
			return "FAIL";
		}
		
	}
	
	@RequestMapping(value="/basketForm", method = RequestMethod.GET, produces = "text/plain; charset=UTF-8")
	//@GetMapping(value="/basketForm")
	public String basketForm(Model model, HttpServletRequest request) {
		log.info("basketForm 호출 성공");
		
		List<BasketVO> list = null;
		BasketVO totalList = null;
		
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("user");
		BasketVO bvo = new BasketVO();
		if(mvo!=null) {
			bvo.setM_num(mvo.getM_num());
			list = basketService.basketList(bvo);
			totalList = basketService.basketTotalList(bvo);
			
			model.addAttribute("basketList", list);
			model.addAttribute("totalList", totalList);
		}
	
		
		
		return "basket/basketForm";
	}
	
	@ResponseBody
	@GetMapping(value="/basketUpdate")
	public String basketUpdate(@ModelAttribute("data") BasketVO bvo, Model model) {
		int result = 0;
		
		result = basketService.basketUpdate(bvo);
		
		return String.valueOf(result);
	}
	
	@ResponseBody
	@GetMapping(value="/basketDelete")
	public String basketDelete(@ModelAttribute("data") BasketVO bvo, Model model) {
		
		int result = 0;
		
		result = basketService.basketDelete(bvo);
		
		return String.valueOf(result); 
	}
	
	
	
}
