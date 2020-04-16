package com.spring.client.member.controller;



import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.client.bookmark.service.BookmarkService;
import com.spring.client.bookmark.vo.BookmarkVO;
import com.spring.client.detail.service.DetailService;
import com.spring.client.detail.vo.DetailVO;
import com.spring.client.member.service.MemberService;
import com.spring.client.member.vo.MemberVO;
import com.spring.client.orders.service.OrdersService;
import com.spring.client.orders.vo.OrdersVO;
import com.spring.client.pointstatus.service.PointStatusService;
import com.spring.client.pointstatus.vo.PointStatusVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import net.nurigo.java_sdk.api.Message;

@Controller
@RequestMapping("/member/*")
@Log4j
@AllArgsConstructor
public class MemberController {
	//인증번호
	private static String code = "";
	
	private MemberService memberService;
	private OrdersService ordersService;
	private DetailService detailService;
	private BookmarkService bookmarkService;
	private PointStatusService pointStatusService;
	
	/**********************
	 * 로그인 페이지 가기
	 *************************/
	@RequestMapping(value="/login",method = {RequestMethod.POST,RequestMethod.GET})
	public String login() {
		log.info("login 호출 성공");
		return "member/login";
	}
	
	@ResponseBody
	@RequestMapping(value="/loginCheck")
	public ResponseEntity<Integer> loginCheck(@ModelAttribute MemberVO mvo,HttpServletRequest request){
		log.info("loginCheck 호출 성공");
		log.info("mvo : "+mvo);
		ResponseEntity<Integer> entity = null;
		int result = 0;
		result = memberService.loginCheck(mvo);
		HttpSession session = request.getSession();
		if(result == 1) {
			MemberVO vo = memberService.userInfo(mvo);
			session.setAttribute("user", vo);
		}
		entity =  new ResponseEntity<Integer>(result,HttpStatus.OK);
		return entity;
	}
	
	@RequestMapping(value="/logout")
	public String logout(HttpServletRequest request) {
		log.info("로그아웃 호출 성공");
		HttpSession session = request.getSession();
		session.invalidate();
		
		return "redirect:/";
	}
	
	@RequestMapping(value="/signup")
	public String signup() {
		
		return "member/signup";
	}
	
	
	//마이페이지 or 주문내역
	@RequestMapping(value= {"/myPage","/orders"})
	public String myPage(Model model,HttpServletRequest request) {
		log.info("myPage 호출 성공");
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("user");
		if(mvo!=null) {
			MemberVO info = memberService.memberInfo(mvo);
			log.info("info : "+info);
			model.addAttribute("info",info);			
			List<OrdersVO> ordersInfo = ordersService.userOrdersInfo(mvo);
			log.info("ordersInf : "+ordersInfo);
			model.addAttribute("ordersInfo",ordersInfo);
		}
		
		return "myPage/orders";
	}
	
	//주문상세내역
	@RequestMapping(value="/detail")
	public String detailPage(@ModelAttribute("o_num") int o_num,Model model,HttpServletRequest request) {
		log.info("detail 호출 성공");
		log.info("o_num : "+o_num);
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("user");
		if(mvo!=null) {
			MemberVO info = memberService.memberInfo(mvo);
			model.addAttribute("info",info);
			
			OrdersVO ordersInfo = ordersService.userOrders(o_num);
			log.info("ordersInfo : "+ordersInfo);
			model.addAttribute("ordersInfo",ordersInfo);
			
			List<DetailVO> detailInfo = detailService.getDetail(o_num);
			log.info("detailInfo : "+detailInfo);
			model.addAttribute("detailInfo",detailInfo);
			
		}
		
		return "myPage/detail";
	}
	
	//자주사는것
	@RequestMapping(value="/bookmark")
	public String bookmark(Model model,HttpServletRequest request) {
		log.info("bookmark 호출 성공");
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("user");
		log.info("mvo : "+mvo);
		if(mvo!=null) {
			MemberVO info = memberService.memberInfo(mvo);
			log.info("info : "+info);
			model.addAttribute("info",info);
			
			List<BookmarkVO> bMKList = bookmarkService.userBMKList(mvo.getM_num());
			log.info("bMKList : "+bMKList);
			model.addAttribute("bMKList",bMKList);			
		}
		return "myPage/bookmark";
	}
	
	
	@ResponseBody
	@PostMapping(value="/idCheck")
	public ResponseEntity<Integer> idCheck(@ModelAttribute("m_id") String m_id) {
		log.info("idCheck 호출 성공");
		log.info("m_id : "+m_id);
		int result = memberService.idCheck(m_id);
		ResponseEntity<Integer> entity = null;
		entity = new ResponseEntity<Integer>(result , HttpStatus.OK);
		return entity;
	}
	
	@ResponseBody
	@PostMapping(value="/emailCheck")
	public ResponseEntity<Integer> emailCheck(MemberVO mvo){
		log.info("emailCheck 호출 성공");
		log.info("mvo : "+mvo);
		int result = memberService.emailCheck(mvo);
		ResponseEntity<Integer> entity = null;
		entity = new ResponseEntity<Integer>(result , HttpStatus.OK);
		return entity;
	}
	
	@ResponseBody
	@PostMapping(value="/sendSMS")
	public ResponseEntity<String> sendSMS(@ModelAttribute("m_phone") String m_phone) throws Exception{
		log.info("sendSMS 호출 성공");
		log.info("m_phone : "+m_phone);
		int result = memberService.phoneCheck(m_phone);
		ResponseEntity<String> entity = null;
		log.info("인증번호 생선 전 code = "+code);
		code = "";
		for(int i=0;i<6;i++) {
			code += (int)(Math.random() *10);
		}
		log.info("인증번호 생성 후 code = "+code);
		String api_key = "NCSX79KMOSBEKV7J"; //위에서 받은 api key를 추가
        String api_secret = "0WMRI4XLXHAYK6PM79KTKBDEZ6EDZGTK";  //위에서 받은 api secret를 추가
		
        Message coolsms = new Message(api_key, api_secret);
        HashMap<String, String> set = new HashMap<String, String>();
        set.put("to", m_phone);
        set.put("from","01040876820");
        set.put("text","[논바마켓 인증번호]\n인증번호는 "+code+" 입니다.");
        set.put("type","sms");
        
		if(result == 1) {
			entity = new ResponseEntity<String>("OVERLAP", HttpStatus.OK);
		}
		else if(result == 0) {
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			coolsms.send(set);
			
		}
		log.info("entity : "+entity);
		return  entity;
	}
	
	@ResponseBody
	@PostMapping(value = "/codeCheck")
	public String codeCheck(@ModelAttribute("code") String code) {
		log.info("codeCheck 호출 성공");
		log.info("입력한 code 값 : "+code);
		String result = "";
		
		if(this.code.equals(code)) {
			result = "SUCCESS";
		}
		else {
			result = "FAIL";
		}
		
		
		return result;
	}
	
	@PostMapping(value = "/memberInsert")
	public String memberInsert(MemberVO mvo, RedirectAttributes ras) {
		log.info("memberInsert 호출 성공");
		log.info("MemberVO : "+mvo);
		String path = "";
		String s_result = "";
		
		int result = memberService.memberInsert(mvo);
		if(result == 1) {
			path = "/member/login";
			s_result = "회원가입에 성공하였습니다.";
		}
		else {
			path ="/member/signup";
			s_result = "오류가 있어 회원가입에 실패하였습니다.";
		}
		
		ras.addFlashAttribute("s_result",s_result);
		
		return "redirect:"+path;
	}
	
	@ResponseBody
	@PostMapping(value = "/cancel", produces = "text/plain; charset=UTF-8")
	public String orderCancel(int o_num) {
		log.info("orderCancel 호출 성공");
		log.info("o_num : "+o_num);
		int result = ordersService.orderCancel(o_num);
		
		if(result==1) {
			return "성공";
		}
		
		return "5252";
	}
	
	@RequestMapping(value="/review")
	public String reviews(Model model, HttpServletRequest request) {
		log.info("reviews 호출 성공");
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("user");
		if(mvo!=null) {
			MemberVO info = memberService.memberInfo(mvo);
			model.addAttribute("info",info);
			
			DetailVO dvo = detailService.reviewCnt(mvo.getM_num());
			model.addAttribute("cnt",dvo);
			log.info("dvo : "+dvo);			
		}
		return "myPage/viewList";
	}
	
	@RequestMapping(value="/point")
	public String point(Model model, HttpServletRequest request) {
		log.info("point 호출 성공");
		
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("user");
		if(mvo!=null) {
			MemberVO info = memberService.memberInfo(mvo);
			model.addAttribute("info",info);
			
			PointStatusVO userPointInfo = pointStatusService.userPointInfo(mvo.getM_num());
			log.info("userPointInfo : "+userPointInfo);
			model.addAttribute("userPointInfo",userPointInfo);
		}
		
		
		
		return "myPage/pointStatus";
	}
	
	@RequestMapping(value="/coupon")
	public String coupon(Model model, HttpServletRequest request) {
		log.info("coupon 호출 성공");
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("user");
		if(mvo !=null) {
			MemberVO info = memberService.memberInfo(mvo);
			model.addAttribute("info",info);			
		}
		return "myPage/couponList";
	}
	
	@RequestMapping(value="myInfo")
	public String myInfo(HttpServletRequest request,Model model) {
		log.info("myInfo 호출 성공");
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("user");
		if(mvo!=null) {
			MemberVO info = memberService.memberInfo(mvo);
			log.info("info : "+info);
			model.addAttribute("info",info);
			if(session.getAttribute("pwdCheck")==null) {
				session.setAttribute("pwdCheck", "false");
			}
			else if(((String)session.getAttribute("pwdCheck")).equals("true")) {
				MemberVO vo = memberService.memberLookup(mvo.getM_num());
				request.setAttribute("myInfo", vo);
				log.info("vo: "+vo);
			}			
		}
		
		return "myPage/myInfo";
	}
	
	@ResponseBody
	@RequestMapping(value="pwdCheck",produces = "text/plain; charset=UTF-8")
	public String pwdCheck(MemberVO mvo,HttpServletRequest request) {
		log.info("pwdCheck 호출 성공");
		log.info(mvo);
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO) session.getAttribute("user");
		vo.setM_pwd(mvo.getM_pwd());
		int result = memberService.pwdCheck(vo);
		if(result==1) {
			session.setAttribute("pwdCheck", "true");
			return "SUCCESS";
		}
		else {
			return "FAIL";
		}
		
	}
	
	@ResponseBody
	@PostMapping(value="/memberUpdate")
	public String memberUpdate(MemberVO mvo) {
		log.info("memberUpdate 호출성공");
		log.info("mvo : "+mvo);
		int result = memberService.memberUpdate(mvo);
		if(result==1) {
			return "SUCCESS";
		}
		else {
			return "FAIL";
		}
	}
	
	@ResponseBody
	@PostMapping(value="/withdraw")
	public String withdraw(int m_num,HttpServletRequest request) {
		log.info("withdraw 호출 성공");
		HttpSession session = request.getSession();
		int result = memberService.withdraw(m_num);
		if(result==1) {
			session.invalidate();
			return "SUCCESS";
		}
		else {
			return "FAIL";
		}
	}
}
