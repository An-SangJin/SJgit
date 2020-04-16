package com.spring.admin.review.vo;

import lombok.Data;

@Data
public class AdminReviewVO {
	private int re_num;			//후기 번호
	private int m_num;			//회원 번호
	private int p_num;			//상품번호
	private String re_title;	//후기 제목
	private String re_content;	//후기 본문
	private int gpa;			//후기 평점
	private String re_regdate;	//후기 등록일자
	private String re_img;		//후기 이미지
	private int re_cnt;			//후기 조회수
	
	//추가한거
	private String m_name;		//호원 이름
	private String m_id;		//회원 아이디
	private String p_name;		//상품 이름
	private String search;	
	private String keyword;
	
	private String startDate;
	private String endDate;
}
