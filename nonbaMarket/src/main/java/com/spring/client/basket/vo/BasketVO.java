package com.spring.client.basket.vo;

import lombok.Data;

@Data
public class BasketVO {
	private int b_num;			//장바구니 고유번호
	private int m_num;			//회원고유번호
	private long p_num;			//상품고유번호
	private int op_num=0;			//옵션고유번호
	private int b_amount;		//수량
	private int b_price;		//단가
	private String b_regdate;	//등록일
	
	private int op_price;
	
	private String p_img; 		//상품 이미지
	private String p_name;
	private int t_payment;
	private int t_price;
	private int p_sale;
	private String op_name;
	private int delivery;
	private int p_price;
}
