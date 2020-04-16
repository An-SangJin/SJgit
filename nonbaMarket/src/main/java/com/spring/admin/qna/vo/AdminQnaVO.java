package com.spring.admin.qna.vo;

import lombok.Data;

@Data
public class AdminQnaVO {
	private int q_num;			//1:1문의 고유번호
	private int m_num;			//회원 번호
	private int o_num;			//주문 번호
	private String q_category;	//카테고리
	private String q_title;		//글제목
	private String q_email;		//이메일
	private String q_phone;		//휴대폰번호
	private String q_content;	//글 본문
	private String q_attimg;	//글 첨부사진
	private String q_emailsend;	//이메일 답변 여부
	private String q_smssend;	//sms 답변 여부
	private String q_state;		//답변상황
	
	//추가한거
	private String m_name;		//회원명
	private String m_id;		//회원아이디
	
	private String sendTitle;
	private String sendContent;
}
