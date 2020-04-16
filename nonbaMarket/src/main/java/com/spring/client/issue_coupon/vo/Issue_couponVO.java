package com.spring.client.issue_coupon.vo;

import lombok.Data;

@Data
public class Issue_couponVO {
	private int i_num;			//발급쿠폰 고유번호
	private int c_num;			//쿠폰 고유번호
	private int m_num;			//멤버 고유번호
	private String i_state;		//발급쿠폰 사용여부
	private String i_regdate;	//쿠폰발급일자
	
	//추가한거
	private String c_name;		//쿠폰 이름
	private String c_func;		//쿠폰기능
	private float c_percent;	//쿠폰 할인/적립률
	private String c_expire;	//유효기간
}
