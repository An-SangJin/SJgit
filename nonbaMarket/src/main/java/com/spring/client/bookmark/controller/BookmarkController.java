package com.spring.client.bookmark.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.client.bookmark.service.BookmarkService;
import com.spring.client.bookmark.vo.BookmarkVO;

import edu.emory.mathcs.backport.java.util.Arrays;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping(value = "/bookmark/*")
@AllArgsConstructor
public class BookmarkController {
	
	private BookmarkService bookmarkService;
	
	@ResponseBody
	@PostMapping(value="/delBMK", produces = "text/plain; charset=UTF-8")
	public String delBMK(BookmarkVO bvo) {
		log.info("delBMK 호출 성공");
		log.info("bvo : "+bvo);
		int result = bookmarkService.delBMK(bvo);
		if(result == 1) {
			return "SUCCESS";
		}
		else {
			return "FAIL";			
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value="/delChkBMK")
	public String delChkBMK(int[] bm_num) {
		log.info("delChkBMK 호출성공");
		log.info("bm_num : "+Arrays.toString(bm_num));
		int result =0;
		for(int cnt : bm_num) {
			BookmarkVO vo = new BookmarkVO();
			vo.setBm_num(cnt);
			result += bookmarkService.delBMK(vo);
		}
		
		if(result == bm_num.length) {
			return "SUCCESS";
		}
		else {
			return "FAIL";
		}
	}
}
