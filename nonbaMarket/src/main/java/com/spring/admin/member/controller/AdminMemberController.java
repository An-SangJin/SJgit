package com.spring.admin.member.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.admin.admin.service.AdminAdminService;
import com.spring.admin.admin.vo.AdminAdminVO;
import com.spring.admin.common.vo.PageDTO;
import com.spring.admin.member.service.AdminMemberService;
import com.spring.admin.member.vo.AdminMemberVO;
import com.spring.common.excel.ListExcelView;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@AllArgsConstructor
@RequestMapping(value="/adminMember/*")
@Log4j
public class AdminMemberController {

	
	private AdminMemberService adminMemberService;
	private AdminAdminService adminAdminService;
	
	@RequestMapping(value="/memberList")
	public String memberList(@ModelAttribute("data") AdminMemberVO avo,Model model) {
		
		List<AdminMemberVO> list = adminMemberService.memberList(avo);
		
		int count= adminMemberService.countMemberList(avo);
		
		model.addAttribute("list",list);
		
		model.addAttribute("count",count);
		
		model.addAttribute("pageMaker",new PageDTO(avo,count));
		
		return "adminMember/memberList";
	}
	
	@ResponseBody
	@RequestMapping(value="/memberExcel",method=RequestMethod.GET)
	public ModelAndView memberExcel(@ModelAttribute AdminMemberVO avo) {
		
		List<AdminMemberVO> memberList=adminMemberService.memberExcel(avo);
		
		
		
		ModelAndView mv = new ModelAndView(new ListExcelView());
		mv.addObject("list",memberList);
		mv.addObject("template","member.xlsx");
		mv.addObject("file_name","member");
		
		return mv;
	}
	
	@RequestMapping(value="/couponList")
	public String couponList(Model model) {
		log.info("couponList 호출 성공");
		List<AdminAdminVO> list = null;
		list = adminAdminService.adminList();
		model.addAttribute("list",list);
		return "adminMember/couponList";
	}
}
