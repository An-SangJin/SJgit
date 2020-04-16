package com.spring.client.detail.vo;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;

@Data
public class DetailVO {
	private int d_num;			//상세테이블 고유번호
	private int o_num;			//주문 고유번호
	private long p_num;			//상품 고유번호
	private int op_num;			//상품 옵션 고유번호
	private String d_name;		//주문자 이름
	private String d_img;		//상품이미지
	private int d_amount;		//상품 주문갯수
	private int d_price;			//상품 단가
	private String ans_state;		//상품후기 상태

	
	//가져올거
	private String p_name;		//상품명
	private String op_name;		//옵션명
	private String o_regdate;	//등록일자
	
	private int cnt_o;
	private int cnt_x;
	
	private List<DetailVO> list;
}
