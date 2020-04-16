package com.spring.admin.admin.vo;

import lombok.Data;

@Data
public class AdminAdminVO {
	private int a_num;			//관리자 번호
	private String a_name;		//관리자이름
	private String a_nickname;	//관리자 별칭
	private String a_id;		//관리자 아이디
	private String a_pwd;		//관리자 비밀번호
	private String a_regdate;	//관리자 등록일자
	
}
