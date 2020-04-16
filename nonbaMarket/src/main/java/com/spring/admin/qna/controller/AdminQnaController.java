package com.spring.admin.qna.controller;

import java.util.Arrays;

import javax.mail.internet.MimeMessage;

import org.springframework.http.MediaType;
import org.springframework.mail.MailSender;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.admin.qna.service.AdminQnaService;
import com.spring.admin.qna.vo.AdminQnaVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping(value = "/adminQna/*")
public class AdminQnaController {

	private AdminQnaService adminQnaService;
	
	private JavaMailSender mailSender;
	
	@RequestMapping(value="/qna")
	public String qna() {
		log.info("qna 호출 성공");
		
		return "adminBoards/qnaList";
	}
	
	@ResponseBody
	@RequestMapping(value="/qnaList",produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public String qnaList(AdminQnaVO aqvo) {
		log.info("qnaList 호출 성공");
		log.info("aqvo : "+aqvo);
		String listData = adminQnaService.qnaList(aqvo);
		
		return listData;
	}
	
	@ResponseBody
	@RequestMapping(value="/deleteQna")
	public String deleteQna(int[] q_num) {
		log.info("deleteQna 호출 성공");
		log.info("q_num : "+Arrays.toString(q_num));
		
		int result = 0;
		for(int cnt : q_num) {
			result += adminQnaService.deleteQna(cnt);
		}
		
		if(result == q_num.length){
			return "SUCCESS";			
		}
		else {
			return "FAIL";
		}
	}
	
	@ResponseBody
	@RequestMapping(value ="/replyProcess")
	public String replyProcess(AdminQnaVO aqvo) {
		log.info("replyProcess 호출 성공");
		log.info("aqvo : "+aqvo);
		AdminQnaVO vo = adminQnaService.getRealEmailPhone(aqvo);
		if(aqvo.getQ_emailsend().equals("O")) {
			StringBuffer preQna = new StringBuffer();
			preQna.append("------------------------------------\n");
			preQna.append("글번호 : "+aqvo.getQ_num()+"\n");
			preQna.append("글 내용 : "+aqvo.getQ_content()+"\n");
			preQna.append("------------------------------------\n\n\n");
			preQna.append(aqvo.getSendContent());
			
			String setFrom ="rvd2et@gmail.com";
			String toMail = vo.getQ_email();
			String title = aqvo.getSendTitle();
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
		
		if(aqvo.getQ_smssend().equals("O")) {
			
		}
		int result = adminQnaService.replyProcess(aqvo);
		if(result == 1) {
			return "SUCCESS";
		}
		else {
			return "FAIL";
		}
	}
}
