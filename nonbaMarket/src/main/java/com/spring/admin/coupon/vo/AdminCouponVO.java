package com.spring.admin.coupon.vo;

import lombok.Data;

@Data
public class AdminCouponVO {
	private int c_num=0;		//쿠폰 고유번호
	private String c_name="";	//쿠폰명
	private String c_func="";	//쿠폰기능
	private float c_percent=0;	//쿠폰 할인/적립률
	private String c_expire="";	//쿠폰 유효기간
	private int a_num=0;			//관리자 고유번호
	
	//추가한거
	private String a_name="";		//관리자이름
	private int c_percent1=0;		//시작범위
	private int c_percent2=0;		//끝범위
	
	
	
}
