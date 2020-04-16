package com.spring.client.qna.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.spring.client.member.vo.MemberVO;
import com.spring.client.qna.service.QnaService;
import com.spring.client.qna.vo.QnaVO;
import com.spring.common.vo.PageDTO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping(value="/qna/*")
public class QnaController {

	@Setter(onMethod_ =@Autowired)
	private QnaService qnaService;
	
	
	
	
	/*파라미터를 바인딩할 때 자동으로 호출되는 @InitBinder를 이용해서 변환을 처리할 수 있다.*/
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(MultipartFile.class, "file",new StringTrimmerEditor(true));
	}
	
	
	/**
	 * 글목록 구현하기(테이블 처리 목록 조회)
	 */
	
	@RequestMapping(value = "/qnaList", method = RequestMethod.GET)
	public String qnaList(@ModelAttribute("data") QnaVO qvo, Model model,HttpServletRequest request) {
		log.info("qnaList 호출성공");
		HttpSession session = request.getSession();
		if(session.getAttribute("user")!=null) {
			MemberVO vo = (MemberVO) session.getAttribute("user");
			qvo.setM_num(vo.getM_num());
			List<QnaVO> qnaList = qnaService.qnaList(qvo);
			model.addAttribute("qnaList", qnaList);
			log.info(qnaList);
			int total = qnaService.qnaListCnt(qvo);
			
			model.addAttribute("pageMaker", new PageDTO(qvo, total));
			
			
		}
		
		
		return "boards/qna";
	}
	
	
	//인서트창에 값주입과 인서트창 호출
	@RequestMapping(value = "/qnaInsert", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE,MediaType.APPLICATION_ATOM_XML_VALUE}, method = RequestMethod.GET)
	public String qnaInsert(@ModelAttribute("data")QnaVO qvo, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO) session.getAttribute("user");
		if(vo!=null) {
			qvo.setM_num(vo.getM_num());
			List<QnaVO> orderList = qnaService.qnaInsert(qvo);
			model.addAttribute("orderList", orderList);
			
			
			MemberVO mvo = new MemberVO();
			mvo.setM_num(vo.getM_num());
			mvo = qnaService.emailphone(mvo);
			model.addAttribute("mvo",mvo);			
		}

		
		return "boards/qnainsert";
	}
	
	//입력
	@ResponseBody
	@PostMapping(value="/qnaupload", produces = "text/plain; charset=UTF-8")
	public String qnaupload(QnaVO qvo,HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO) session.getAttribute("user");
		if(vo!=null) {
			qvo.setM_num(vo.getM_num());
		}
		if(qvo.getQ_emailsend() == null) {
			qvo.setQ_emailsend("X");
		}
		if(qvo.getQ_smssend() == null) {
			qvo.setQ_smssend("X");
		}
		
		
		String value = "";
		int result = 0;
		
		result = qnaService.qnaupload(qvo);
		if(result==1) {
			value = "성공";
		}else {
			value = "실패";
		}
		return value;
	}
	
	//수정창 부르기
	@RequestMapping(value = "/qnaupdatepop", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE,MediaType.APPLICATION_ATOM_XML_VALUE}, method = RequestMethod.GET)
	public String qnaupdatepop(@ModelAttribute("data")QnaVO qvo, Model model,HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session.getAttribute("user")!=null) {
			MemberVO mvo = (MemberVO) session.getAttribute("user");
			qvo.setM_num(mvo.getM_num());
		}
		log.info("qvo : "+qvo);
		List<QnaVO> orderList = qnaService.qnaInsert(qvo);
		log.info(orderList);
		model.addAttribute("orderList", orderList);

		/*
		MemberVO mvo = new MemberVO();
		mvo = qnaService.emailphone(mvo);
		model.addAttribute("mvo",mvo);
		*/
		
		QnaVO infoqvo = new QnaVO();
		infoqvo = qnaService.qinfo(qvo);
		
		model.addAttribute("infoqvo",infoqvo);
		
		
		return "boards/qnaupdate";
	}
	
	
	//수정
	@ResponseBody
	@PostMapping(value = "/qnaUpdate", produces = "text/plain; charset=UTF-8")
	public String qnaUpdate(@ModelAttribute QnaVO qvo, Model model) {
		log.info("qnaUpdate 호출 성공");
		
		String value = "";
		int result = 0;
		
		if(qvo.getQ_emailsend() == null) {
			qvo.setQ_emailsend("X");
		}
		if(qvo.getQ_smssend() == null) {
			qvo.setQ_smssend("X");
		}
		
		result = qnaService.qnaUpdate(qvo);
		if(result==1) {
			value = "성공";
		}else {
			value = "실패";
		}
		return value;
	}
	
	//삭제
	@ResponseBody
	@RequestMapping(value = "/qnaDelete",method = RequestMethod.POST, produces = "text/plain; charset=UTF-8")
	public String qnaDelete(@ModelAttribute QnaVO qvo) {
		
		log.info("qvo : "+qvo);
		if(qvo.getQ_attimg().equals("")) {
			qvo.setQ_attimg(null);
		}
		int result = 0;
		String value = "";
		result = qnaService.qnaDelete(qvo);
		if(result == 1) {
			value = "성공";
		}else {
			value = "실패";
		}
		return value;
		
	}
	
	
}
