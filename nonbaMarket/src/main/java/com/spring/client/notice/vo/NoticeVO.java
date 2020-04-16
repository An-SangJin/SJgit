package com.spring.client.notice.vo;

import com.spring.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
//본 프로젝트에선 필요없음
@EqualsAndHashCode(callSuper=false) 
public class NoticeVO extends CommonVO {
	//공지 게시판
	
	private int n_num = 0;
	//원래거
	//private int a_num =0;
	private String a_nickname ="";
	private String n_title ="";
	private String n_content = "";
	private int n_cnt = 0;
	private String n_regdate;
}
