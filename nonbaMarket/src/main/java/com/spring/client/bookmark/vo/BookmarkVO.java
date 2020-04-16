package com.spring.client.bookmark.vo;

import lombok.Data;

@Data
public class BookmarkVO {
	private int bm_num;			//즐겨찾기 고유번호
	private long p_num;			//상품고유번호
	private int op_num;			//옵션고유번호
	private int m_num;			//회원고유번호
	private String bm_regdate;	//등록일자
	
	
	////////추가한거
	private String p_name;		//상품 이름
	private String p_img;		//상품이미지
	private int p_price;		//상품가격
	private String op_name;		//옵션이름
	private int op_price;		//옵션가격
}
