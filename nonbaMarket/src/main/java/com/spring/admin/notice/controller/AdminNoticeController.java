package com.spring.admin.notice.controller;

import java.util.Arrays;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.admin.notice.service.AdminNoticeService;
import com.spring.admin.notice.vo.AdminNoticeVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping(value="/adminNotice/*")
@AllArgsConstructor
public class AdminNoticeController {

	private AdminNoticeService adminNoticeService;
	
	@RequestMapping(value="/notice")
	public String notice() {
		
		return "adminBoards/noticeList";
	}
	
	@ResponseBody
	@RequestMapping(value="/noticeList",produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public String noticeList(AdminNoticeVO anvo) {
		log.info("noticeList 호출 성공");
		log.info("anvo : "+anvo);
		String listData = adminNoticeService.noticeList(anvo);
		return listData;
	}
	
	@ResponseBody
	@RequestMapping(value="/deleteNotice")
	public String deleteNotice(int[] n_num) {
		log.info("deleteNotice 호출 성공");
		log.info("c_num : "+Arrays.toString(n_num));
		
		int result = 0;
		for(int cnt : n_num) {
			result +=adminNoticeService.deleteNotice(cnt);
		}
		
		if(result == n_num.length) {
			return "SUCCESS";			
		}
		else {
			return "FAIL";
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value="/updateNotice")
	public String updateNotice(AdminNoticeVO anvo) {
		log.info("updateNotice 호출 성공");
		log.info("anvo : "+anvo);
		int result = adminNoticeService.updateNotice(anvo);
		
		if(result == 1) {
			return "SUCCESS";
		}
		else {
			return "FAIL";
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value="/insertNotice")
	public String insertNotice(AdminNoticeVO anvo) {
		log.info("insertNotice 호출 성공");
		log.info("anvo : "+anvo);
		int result = adminNoticeService.insertNotice(anvo);
		
		if(result == 1) {
			return "SUCCESS";
		}
		else {
			return "FAIL";
		}
		
	}
}
