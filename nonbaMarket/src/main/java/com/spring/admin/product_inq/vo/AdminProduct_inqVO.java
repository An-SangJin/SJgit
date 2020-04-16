package com.spring.admin.product_inq.vo;

import lombok.Data;

@Data
public class AdminProduct_inqVO {
	private int pi_num;			//문의글번호
	private int m_num;			//회원번호
	private int p_num;			//상품고유번호
	private String pi_title;	//상품문의 글제목
	private String pi_content;	//상품문의 본문
	private String pi_regdate;	//상품문의 등록일자
	private int pi_reproot;		//본글의 번호참조값
	private int pi_repstep;		//답글 위치번호
	private String pi_emailsend;//답글 이메일 전송여부
	private String pi_smssend;	//답글 휴대전화 전송여부
	private String pi_secret;	//답글 비밀글
	private String pi_state;	//답글 처리여부
	
	//추가한거
	private String m_name;
	private String m_id;
	private String p_name;
	
	private String search;
	private String keyword;
	private String startDate;
	private String endDate;
	
	private String sendTitle;
	private String sendContent;
}
