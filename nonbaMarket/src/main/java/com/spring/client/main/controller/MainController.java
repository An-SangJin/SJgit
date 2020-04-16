package com.spring.client.main.controller;

import java.util.List;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.client.product.service.ProductService;
import com.spring.client.product.vo.Large_categoryVO;
import com.spring.client.product.vo.Mc_categoryVO;
import com.spring.client.product.vo.ProductVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class MainController {
	
	private ProductService productService;
	
//	@RequestMapping(value = "/", method = RequestMethod.GET)
//	public String home() {
//		log.info("메인화면 호출 성공");
//		
//		return "index";
//	}
	
	@RequestMapping(value="/",method = RequestMethod.GET)
	public String main(Model model) {
		log.info("Main 호출 성공");
		List<ProductVO> list = productService.mainNewProduct();
		model.addAttribute("list",list);
		return "main";
	}
	@ResponseBody
	@RequestMapping(value = "/mainCategori",produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public List<Large_categoryVO> mainCategori(Model model) {
		
		List<Large_categoryVO> large = productService.largeCategory();
		/* List<Mc_categoryVO> mid = productService.midCategory(); */
		/* log.info("list"+large); */
		
		return large;
	}
	@ResponseBody
	@RequestMapping(value = "/mainMcCategori/{lc_num}", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public List<Mc_categoryVO> mcCategori(@PathVariable("lc_num") String lc_num){
		
		List<Mc_categoryVO> mid = productService.midCategory(lc_num);
		
		return mid;
	}
}
