package com.spring.client.review.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.spring.client.detail.service.DetailService;
import com.spring.client.member.vo.MemberVO;
import com.spring.client.qna.vo.QnaVO;
import com.spring.client.review.service.ReviewService;
import com.spring.client.review.vo.ReviewVO;
import com.spring.common.vo.PageDTO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/review/*")
@Log4j
@AllArgsConstructor
public class ReviewController {
	
	private ReviewService reviewService;
	private DetailService detailService;
	
	//파라미터를 바인딩할 때 자동으로 호출되는 @InitBinder를 이용해서 변환을 처리할 수 있다.
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(MultipartFile.class, "file",new StringTrimmerEditor(true));
	}

	@ResponseBody
	@RequestMapping(value="/reviewAfterList",produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public String reviewAfterList(int m_num) {
		log.info("reviewAfterList 호출성공");
		log.info("m_num : "+m_num);
		String listData = reviewService.reviewAfterList(m_num);
		log.info("listData : "+listData);
		
		
		return listData;
	}
	
	@ResponseBody
	@PostMapping(value="/reviewInsert", produces = "text/plain; charset=UTF-8")
	public String reviewInsert(ReviewVO rvo, int d_num) {
		log.info("reviewInsert 호출성공");
		if(rvo.getFile()!=null) log.info("rvo 파일 : "+ rvo.getFile().getOriginalFilename());
		
		log.info("d_num : "+d_num);
		
		log.info("rvo : "+rvo);
		
		String value="";
		int result = reviewService.reviewInsert(rvo);
		if(result==1) {
			int result2 = detailService.reviewAfterUpdate(d_num);
			if(result2 == 1) {
				value="성공";				
			}
			else {
				value="실패";
			}
		}
		else {
			value="실패";
		}
		
		return value;
	}
	
	@ResponseBody
	@PostMapping(value="/reviewUpdate",produces = "text/plain; charset=UTF-8")
	public String reviewUpdate(ReviewVO rvo) {
		log.info("reviewUpdate 호출 성공");
		if(rvo.getFile()!=null) log.info("rvo 파일 이름 : "+rvo.getFile().getOriginalFilename());
		
		log.info("rvo : "+rvo);
		
		String value="";
		int result = reviewService.reviewUpdate(rvo);
		if(result==1) {
			value="성공";
		}
		else {
			value="실패";
		}
		
		return value;
		
	}
	
	@ResponseBody
	@PostMapping(value="/reviewDelete",produces = "text/plain; charset=UTF-8")
	public String reviewDelete(String re_num) {
		log.info("reviewDelete 호출 성공");
		log.info("re_num : "+re_num);
		
		String value="";
		int result = reviewService.reviewDelete(re_num);
		if(result==1) {
			value="성공";
		}
		else {
			value="실패";
		}
		
		return value;
	}
	
	
	
	
	
	
	
	/**
	 * 글목록 구현하기(테이블 처리 목록 조회)
	 */
	
	@RequestMapping(value = "/reviewList", method = RequestMethod.GET)
	public String reviewList(@ModelAttribute("data") ReviewVO rvo, Model model) {
		

		List<ReviewVO> reviewList = reviewService.reviewList2(rvo);

		model.addAttribute("reviewList", reviewList);
		log.info(reviewList);

		
		int total = reviewService.reviewListCnt2(rvo);
		
		model.addAttribute("pageMaker", new PageDTO(rvo, total));
		
		return "boards/review";
	}
	
	
	//조회수 처리
	@ResponseBody
	@GetMapping(value = "/reviewCnt" ,produces = "text/plain; charset=UTF-8")
	public String reviewCnt(@ModelAttribute("data") ReviewVO rvo, Model model) {
		int result = 0;
		String cnt = "";

		
		result = reviewService.reviewCnt(rvo);
		
		if(result == 1) {
			cnt = "success";
		} else {
			cnt = "false";
		}
		
		return cnt;
	}
	
		//인서트창에 값주입과 인서트창 호출
		@RequestMapping(value = "/reviewInsert", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE,MediaType.APPLICATION_ATOM_XML_VALUE}, method = RequestMethod.GET)
		public String reviewInsert(@ModelAttribute("data")ReviewVO rvo, Model model,HttpServletRequest request) {
			HttpSession session = request.getSession();
			MemberVO vo = (MemberVO) session.getAttribute("user");
			
			QnaVO qvo = new QnaVO();
			qvo.setM_num(vo.getM_num());
			List<QnaVO> orderList = reviewService.revieworderList(qvo);
			model.addAttribute("orderList", orderList);
			
			log.info(rvo);
			ReviewVO rrvo = new ReviewVO();
			rrvo.setM_num(1);
			
			//세션값 나중에 집어넣기
			
			
			return "boards/reviewinsert";
		}
	
		
		//글쓰기 눌렀을시 후기 작성 가능 여부
		@ResponseBody
		@GetMapping(value = "/reviewConfirm" , produces = {MediaType.APPLICATION_JSON_UTF8_VALUE,MediaType.APPLICATION_ATOM_XML_VALUE})
		public int reviewConfirm(@ModelAttribute("data") ReviewVO rvo, Model model) {
			int result;
			
			result = reviewService.reviewConfirm(rvo);

			return result;
		}
		
		//후기입력
		@ResponseBody
		@PostMapping(value="/reviewupload", produces = "text/plain; charset=UTF-8")
		public String reviewupload(ReviewVO rvo,HttpServletRequest request) {
			HttpSession session = request.getSession();
			MemberVO vo = (MemberVO) session.getAttribute("user");
			//세션으로 m_num을 가져와야함 
			rvo.setM_num(vo.getM_num());
			
			
			String value = "";
			int result = 0;
			
			result = reviewService.reviewupload(rvo);
			if(result==1) {
				
				reviewService.detailupdate(rvo);
				value = "성공";
			}else {
				value = "실패";
			}
			return value;
		}

}
