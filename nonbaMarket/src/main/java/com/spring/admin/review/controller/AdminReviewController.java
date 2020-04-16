package com.spring.admin.review.controller;

import java.util.Arrays;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.admin.review.service.AdminReviewService;
import com.spring.admin.review.vo.AdminReviewVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping(value="/adminReview/*")
@AllArgsConstructor
public class AdminReviewController {
	
	private AdminReviewService adminReviewService;
	
	@RequestMapping(value="/review")
	public String review() {
		log.info("review 호출 성공");
		
		return "adminBoards/reviewList";
	}
	
	@ResponseBody
	@RequestMapping(value="/reviewList",produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public String reviewList(AdminReviewVO arvo) {
		log.info("reviewList 호출 성공");
		log.info("arvo : "+arvo);
		String listData = adminReviewService.reviewList(arvo);
		
		return listData;
		
	}
	
	
	@ResponseBody
	@RequestMapping(value="/deleteReview")
	public String deleteReview(int[] re_num) {
		log.info("deleteReview 호출 성공");
		log.info("re_num : "+Arrays.toString(re_num));
		
		int result = 0;
		for(int cnt : re_num) {
			result += adminReviewService.deleteReview(cnt);
		}
		
		if(result == re_num.length) {
			return "SUCCESS";			
		}
		else {
			return "FAIL";
		}
	}

}
