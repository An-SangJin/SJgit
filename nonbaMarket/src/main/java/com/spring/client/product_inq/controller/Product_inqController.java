package com.spring.client.product_inq.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.client.product_inq.service.Product_inqService;
import com.spring.client.product_inq.vo.Product_inqVO;
import com.spring.common.vo.PageDTO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping(value="/inq/*")
public class Product_inqController {
	
	
	@Setter(onMethod_ = @Autowired)
	private Product_inqService pro_service;
	
	@RequestMapping(value = "/product-inqList", method = RequestMethod.GET)
	public String inqList(@ModelAttribute("data") Product_inqVO ivo, Model model) {
		log.info("inqList 호출성공");
		List<Product_inqVO> inqList = pro_service.inqList2(ivo);

		model.addAttribute("inqList", inqList);

		int total = pro_service.inq_ListCnt(ivo);
		
		model.addAttribute("pageMaker", new PageDTO(ivo, total));
		
		
		
		return "boards/product_inq";
	}
}
