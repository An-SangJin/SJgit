package com.spring.client.grade.vo;

import lombok.Data;

@Data
public class GradeVO {
	private int g_num;			//등급 고유번호
	private String g_name;		//등급 이름
	private float g_percent;	//적립률
	private int g_qual;			//도달 조건
}
