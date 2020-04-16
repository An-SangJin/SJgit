package com.spring.client.detail.controller;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.client.detail.service.DetailService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping(value="/detail/*")
@Log4j
@AllArgsConstructor
public class DetailController {

	private DetailService detailService;
	
	@ResponseBody
	@RequestMapping(value="/reviewBeforeList", produces = {MediaType.APPLICATION_XML_VALUE,MediaType.APPLICATION_JSON_UTF8_VALUE})
	public String reviewBeforeList(int m_num) {
		log.info("reviewBeforeList 호출성공");
		log.info("m_num : "+m_num);
		String listData = detailService.reviewBeforeList(m_num);
		log.info(listData);
		
		return listData;
	}
}
