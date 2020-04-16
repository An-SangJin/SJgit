package com.spring.admin.notice.vo;

import lombok.Data;

@Data
public class AdminNoticeVO {
	private int n_num;			//게시물 번호
	private int a_num;			//관리자 번호
	private String n_title;		//게시물 제목
	private String n_content;	//게시물 본문
	private String n_cnt;		//게시물 조회수
	private String n_regdate;	//게시물 드록일자
	
	//추가한거
	private String a_name;		//관리자 이름
	
	private String search;
	private String keyword;
}
