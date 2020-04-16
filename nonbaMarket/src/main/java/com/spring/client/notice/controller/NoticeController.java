package com.spring.client.notice.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.client.notice.service.NoticeService;
import com.spring.client.notice.vo.NoticeVO;
import com.spring.common.vo.PageDTO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping(value="/notice/*")
public class NoticeController {
		
	@Setter(onMethod_ =@Autowired)
	private NoticeService noticeService;
	
	
	/**
	 * 글목록 구현하기(테이블 처리 목록 조회)
	 */
	
	@RequestMapping(value = "/noticeList", method = RequestMethod.GET)
	public String noticeList(@ModelAttribute("data") NoticeVO nvo, Model model) {
		log.info("NoticeVO 호출성공");
		List<NoticeVO> noticeList = noticeService.noticeList(nvo);
		model.addAttribute("noticeList", noticeList);
		
		
		int total = noticeService.noticeListCnt(nvo);
		
		model.addAttribute("pageMaker", new PageDTO(nvo, total));
		
		return "boards/notice";
	}
	
	
	//조회수 처리
	@ResponseBody
	@GetMapping(value = "/noticeCnt" ,produces = "text/plain; charset=UTF-8")
	public String noticeCnt(@ModelAttribute("data") NoticeVO nvo, Model model) {
		int result = 0;
		String cnt = "";
		log.info("noticeCnt");
		
		result = noticeService.noticeCnt(nvo);
		
		if(result == 1) {
			cnt = "success";
		} else {
			cnt = "false";
		}
		
		return cnt;
	}
}
