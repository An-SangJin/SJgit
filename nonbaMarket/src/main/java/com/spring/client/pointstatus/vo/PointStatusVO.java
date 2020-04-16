package com.spring.client.pointstatus.vo;

import lombok.Data;

@Data
public class PointStatusVO {
	private int ps_num;			//포인트 고유번호
	private int m_num;			//회원고유번호
	private String ps_regdate;	//포인트 생성일
	private String ps_content;	//포인트 내용
	private int ps_point;			//포인트 금액
	private String ps_type;		//포인트 종류
	private String ps_valid;	//포인트 유효기간
	
	
	//추가한거
	private int sum_point;		//회원의 포인트 잔액
	private int lapse_point;	//회원의 소멸예정 포인트
}
