package com.spring.client.review.vo;

import org.springframework.web.multipart.MultipartFile;

import com.spring.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class ReviewVO extends CommonVO {
	private String re_num;		//리뷰 고유번호
	private int m_num;			//회원고유번호
	private long p_num;			//상품고유번호
	private String re_title;	//후기 제목
	private String re_content;	//후기 본문
	private int gpa;			//후기평점
	private	String re_regdate;	//후기 등록일
	private String re_img;		//후기 이미지
	private String re_cnt;		//후기 조회수
	
	//추가한거
	private MultipartFile file;
	private String p_name;		//상품이름
	private String p_img;		//상품이미지
	private int p_price;		//상품가격
	
	
	
	private String m_name;
	private int re_count; //리뷰 개수를 저장할 필드
	
	
	
	private int count;
	
	private int o_num;
	private String m_id;
	private String o_regdate;
	private String d_name;
	private int d_amount;
	private int d_price;
	private String m_email;
	private String m_phone;
	
	private String ans_state;
}
