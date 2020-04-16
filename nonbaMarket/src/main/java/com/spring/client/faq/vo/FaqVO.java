package com.spring.client.faq.vo;


import com.spring.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class FaqVO extends CommonVO {
	//자주 묻는 게시판
	private int f_num = 0;               
	private String f_category = "";    //카테고리
	private String f_title = "";				//제목
	private String f_content = ""; //CLOB		//내용
}
