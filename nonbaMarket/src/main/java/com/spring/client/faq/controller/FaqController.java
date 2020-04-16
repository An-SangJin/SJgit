package com.spring.client.faq.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import com.spring.client.faq.service.FaqService;
import com.spring.client.faq.vo.FaqVO;
import com.spring.common.vo.PageDTO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping(value="/faq/*")
public class FaqController {

	
	@Setter(onMethod_ =@Autowired)
	private FaqService faqService;
	
	
	/**
	 * 글목록 구현하기(테이블 처리 목록 조회)
	 */
	
	@RequestMapping(value = "/faqList", method = RequestMethod.GET)
	public String faqList(@ModelAttribute("data") FaqVO fvo, Model model) {
		log.info("faqList 호출성공");
		log.info(fvo);
		List<FaqVO> faqList = faqService.faqList(fvo);
		model.addAttribute("faqList", faqList);
		log.info(faqList);
		//페이징처리
		
		int total = faqService.faqListCnt(fvo);
		
		model.addAttribute("pageMaker", new PageDTO(fvo, total));
		
		
		return "boards/faq";
	}
	
	/*
	@ResponseBody
	@RequestMapping(value = "/selectList",produces = {MediaType.APPLICATION_JSON_UTF8_VALUE,MediaType.APPLICATION_XML_VALUE}, method = RequestMethod.GET)
	public String selectList(FaqVO fvo) {
		log.info("selectList 호출성공");
		
		String optlist = faqService.selectList(fvo);
		log.info(optlist);
		
		return optlist;
	
	}
	*/
	
}
