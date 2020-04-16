package com.spring.admin.faq.vo;

import lombok.Data;

@Data
public class AdminFaqVO {
	private int f_num;			//자주하는 질문 고유번호
	private String f_category;	//카테고리
	private String f_title;		//제목
	private String f_content;	//글 내용
}
