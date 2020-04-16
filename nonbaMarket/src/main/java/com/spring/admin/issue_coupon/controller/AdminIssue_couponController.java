package com.spring.admin.issue_coupon.controller;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.admin.coupon.vo.AdminCouponVO;
import com.spring.admin.issue_coupon.service.AdminIssue_couponService;
import com.spring.admin.issue_coupon.vo.AdminIssue_couponVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping(value="/AdminIssue_coupon/*")
public class AdminIssue_couponController {

	private AdminIssue_couponService adminIssue_couponService;
	
	@ResponseBody
	@RequestMapping(value="/issue_couponList", produces = {MediaType.APPLICATION_XML_VALUE,MediaType.APPLICATION_JSON_UTF8_VALUE})
	public String issue_couponList(AdminIssue_couponVO avo) {
		log.info("issue_couponList() 호출 성공");
		log.info("avo : "+avo);
		String result = adminIssue_couponService.issue_couponList(avo);
		log.info("result : "+result);
		
		return result;
		
	}
	
	@ResponseBody
	@RequestMapping(value="/deleteIssue_coupon")
	public String deleteIssue_coupon(AdminIssue_couponVO cvo) {
		log.info("deleteIssue_coupon() 호출 성공");
		log.info("cvo : "+cvo);
		int result = adminIssue_couponService.deleteIssue_coupon(cvo);
		
		if(result == 1) {
			return "SUCCESS";
		}
		else {
			return "FAIL";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/insertIssue_coupon")
	public String insertIssue_coupon(int c_num, int g_num) {
		log.info("insertIssue_coupon 호출 성공");
		String result = adminIssue_couponService.insertIssue_coupon(c_num, g_num);
		return result;
	}
}
