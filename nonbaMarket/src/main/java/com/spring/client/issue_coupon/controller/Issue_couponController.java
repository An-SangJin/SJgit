package com.spring.client.issue_coupon.controller;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.client.issue_coupon.service.Issue_couponService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping(value="/issue_coupon/*")
@AllArgsConstructor
public class Issue_couponController {
	
	private Issue_couponService issue_couponService;
	
	@ResponseBody
	@RequestMapping(value="/couponList",produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String couponList(int m_num) {
		log.info("couponList 호출 성공");
		String listData = issue_couponService.couponList(m_num);
		log.info("listData : "+listData);
		
		return listData;
	}
}
