package com.spring.client.pointstatus.controller;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.client.pointstatus.service.PointStatusService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping(value = "/point/*")
@AllArgsConstructor
public class PointStatusController {
	
	private PointStatusService pointStatusService;
	
	@ResponseBody
	@RequestMapping(value="/pointList",produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public String pointList(int m_num) {
		log.info("pointList 호출 성공");
		String listData = pointStatusService.pointList(m_num);
		log.info(listData);
		
		return listData;
	}
}
