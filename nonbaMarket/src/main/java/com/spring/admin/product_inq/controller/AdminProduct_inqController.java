package com.spring.admin.product_inq.controller;

import java.util.Arrays;

import javax.mail.internet.MimeMessage;

import org.springframework.http.MediaType;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.admin.member.service.AdminMemberService;
import com.spring.admin.member.vo.AdminMemberVO;
import com.spring.admin.product_inq.service.AdminProduct_inqService;
import com.spring.admin.product_inq.vo.AdminProduct_inqVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping(value="/adminProduct_inq")
public class AdminProduct_inqController {

	private AdminProduct_inqService adminProduct_inqService;
	private AdminMemberService adminMemberService;
	private JavaMailSender mailSender;
	
	@RequestMapping("/product_inq")
	public String product_inq() {
		log.info("product_inq 호출성공");
		
		return "adminBoards/product_inqList";
	};
	
	@ResponseBody
	@RequestMapping(value="/product_inqList", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public String product_inqList(AdminProduct_inqVO apvo) {
		log.info("product_inqList 호출 성공");
		log.info("apvo : "+apvo);
		
		String listData = adminProduct_inqService.product_inqList(apvo);
		
		return listData;
	}
	
	@ResponseBody
	@RequestMapping(value="/deleteProduct_inq")
	public String deleteProduct_inq(int[] pi_num) {
		log.info("deleteProduct_inq 호출 성공");
		log.info("pi_num : "+Arrays.toString(pi_num));
		
		int result = 0;
		for(int cnt : pi_num) {
			result += adminProduct_inqService.deleteProduct_inq(cnt);
		}
		
		if(result == pi_num.length) {
			return "SUCCESS";
		}
		else {
			return "FAIL";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/replyProcess")
	public String replyProcess(AdminProduct_inqVO apvo) {
		log.info("replyProcess 호출성공");
		log.info("apvo : "+apvo);
		AdminMemberVO vo = adminMemberService.getRealEmailPhone(apvo);
		if(apvo.getPi_emailsend().equals("O")) {
			StringBuffer preQna = new StringBuffer();
			preQna.append("------------------------------------\n");
			preQna.append("글번호 : "+apvo.getPi_num()+"\n");
			preQna.append("글 내용 : "+apvo.getPi_content()+"\n");
			preQna.append("------------------------------------\n\n\n");
			preQna.append(apvo.getSendContent());
			
			String setFrom ="rvd2et@gmail.com";
			String toMail = vo.getM_email();
			String title = apvo.getSendTitle();
			String content = preQna.toString();
			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message,true,"UTF-8");
				messageHelper.setFrom(setFrom);
				messageHelper.setTo(toMail);
				messageHelper.setSubject(title);
				messageHelper.setText(content);
				
				mailSender.send(message);
			}
			catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		if(apvo.getPi_smssend().equals("O")) {
			
		}
		int result1 = adminProduct_inqService.insertReply(apvo);
		if(result1 == 1) {
			int result2 = adminProduct_inqService.replyProcess(apvo);			
			if(result2 == 1) {
				return "SUCCESS";
			}
			else {
				return "FAIL";
			}
		}
		else {
			return "FAIL";			
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value="/replyLookup",produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public String replyLookup(AdminProduct_inqVO apvo) {
		log.info("replyLookup 호출성공");
		log.info("apvo : "+apvo);
		String data = adminProduct_inqService.replyLookup(apvo);
		
		return data;
	}
}
