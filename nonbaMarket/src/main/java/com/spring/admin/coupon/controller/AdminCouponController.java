package com.spring.admin.coupon.controller;

import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.admin.coupon.service.AdminCouponService;
import com.spring.admin.coupon.vo.AdminCouponVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping(value="/adminCoupon/*")
@AllArgsConstructor
public class AdminCouponController {
	
	private AdminCouponService adminCouponService;
	
	@ResponseBody
	@RequestMapping(value="/couponList", produces = {MediaType.APPLICATION_XML_VALUE,MediaType.APPLICATION_JSON_UTF8_VALUE})
	public String couponList(AdminCouponVO cvo) {
		log.info("couponList() 호출 성공");
		log.info("cvo : "+cvo);
		String list = adminCouponService.couponList(cvo);
		
		log.info("list : "+list);
		return list;
	}
	
	@ResponseBody
	@RequestMapping(value="/deleteCoupon")
	public String deleteCoupon(int[] c_num) {
		log.info("deleteCoupon 호출 성공");
		log.info("c_num : "+Arrays.toString(c_num));
		for(int a : c_num) {
			adminCouponService.deleteCoupon(a);
		}
		
		return "SUCCESS";
	}
	
	@ResponseBody
	@RequestMapping(value="/insertCoupon")
	public String insertCoupon(AdminCouponVO avo) {
		int result = adminCouponService.insertCoupon(avo);
		
		if(result == 1) {
			return "SUCCESS";			
		}
		else {
			return "FAIL";
		}
		
	}
}
