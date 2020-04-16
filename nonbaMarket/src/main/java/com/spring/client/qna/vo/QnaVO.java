package com.spring.client.qna.vo;


import org.springframework.web.multipart.MultipartFile;

import com.spring.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class QnaVO extends CommonVO {
	//1:1 문의 게시판
	private int q_num; 
	private int m_num;
	private int o_num=0;
	private String q_category;
	private String q_title;
	private String q_email;
	private String q_phone;
	private String q_content;
	private MultipartFile file;
	private String q_attimg;
	private String q_emailsend; //CHECK(Q_EMAILSEND IN('O','X')) 
	private String q_smssend; // CHECK(Q_SMSSEND IN('O','X')) NOT NULL ,
	private String q_state; // CHECK(Q_STATE IN('O','X')) NOT NULL ,
	
	//주문이랑 디테일 내용
	private String o_regdate;
	private String d_name;
	private int d_amount;
	private int d_price;
	private String m_email;
	private int m_phone;

	
}
