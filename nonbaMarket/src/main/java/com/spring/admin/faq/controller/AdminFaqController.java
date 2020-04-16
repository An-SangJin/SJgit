package com.spring.admin.faq.controller;

import java.util.Arrays;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.admin.faq.service.AdminFaqService;
import com.spring.admin.faq.vo.AdminFaqVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping(value="/adminFaq/*")
@AllArgsConstructor
public class AdminFaqController {
	private AdminFaqService adminFaqService;
	
	@RequestMapping(value="/faq")
	public String faq() {
		
		return "adminBoards/faqList";
	}
	
	@ResponseBody
	@RequestMapping(value="/faqList",produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public String faqList(AdminFaqVO afvo) {
		log.info("faqList 호출 성공");
		log.info("afvo : "+afvo);
		String listData = adminFaqService.faqList(afvo);
		
		return listData; 
	}
	
	@ResponseBody
	@RequestMapping(value="/deleteFaq")
	public String deleteFaq(int[] f_num) {
		log.info("deleteFaq 호출 성공");
		log.info("f_num : "+Arrays.toString(f_num));
		
		int result = 0;
		for(int cnt : f_num) {
			result +=adminFaqService.deleteFaq(cnt);
		}
		
		if(result == f_num.length) {
			return "SUCCESS";			
		}
		else {
			return "FAIL";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/updateFaq")
	public String updateFaq(AdminFaqVO afvo) {
		log.info("updateFaq 호출 성공");
		log.info("afvo : "+afvo);
		int result = adminFaqService.updateFaq(afvo);
		
		if(result == 1) {
			return "SUCCESS";
		}
		else {
			return "FAIL";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/insertFaq")
	public String insertFaq(AdminFaqVO afvo) {
		log.info("insertFaq 호출 성공");
		log.info("afvo : "+afvo);
		int result = adminFaqService.insertFaq(afvo);
		
		if(result == 1) {
			return "SUCCESS";
		}
		else {
			return "FAIL";
		}
	}
}
