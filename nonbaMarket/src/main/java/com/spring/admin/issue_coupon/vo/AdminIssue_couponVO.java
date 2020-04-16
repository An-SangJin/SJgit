package com.spring.admin.issue_coupon.vo;

import lombok.Data;

@Data
public class AdminIssue_couponVO {
	private int i_num;			//발급쿠폰 고유번호
	private int c_num;			//쿠폰 고유번호
	private int m_num;			//회원 고유번호
	private String i_state;		//쿠폰 사용여부
	private String i_regdate;	//쿠폰 발급일자
	
	//추가할거
	private String m_name;		//회원 이름
	private String c_expire;	//쿠폰 유효기간
	private String m_id;		//회원아이디
	
}
