package com.spring.client.orders.vo;

import lombok.Data;

@Data
public class OrdersVO {
	private int o_num;			//주문 고유번호
	private int m_num;			//회원 고유번호
	private String o_name;		//받는사람 이름
	private String o_address;	//받는사람 주소
	private String o_phone;		//받는사람 번호
	private String o_method;	//결제방식
	private String o_deliver;	//배송상태
	private int o_allprice;		//총결제금액
	private String o_invoice;	//송장번호
	private String o_regdate;	//주문일
	private String o_update;	//주문 수정일
	private int i_num;			//사용한쿠폰
	private int o_usepoint;		//사용한 포인트
	
	//가져올떄
	private String d_name;		//상품명
	private int d_cnt;			//상품갯수
	private int o_getpoint;		//적립포인트
	
	private String d_img;
}
