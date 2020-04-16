package com.spring.client.product_inq.vo;

import com.spring.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class Product_inqVO extends CommonVO {
	private int pi_num;
	private int m_num;
	private String m_name;
	private long p_num;
	private String pi_title;
	private String pi_content;
	private String pi_regdate;
	private int pi_reproot;
	private int pi_repstep;
	private String pi_emailsend ="X";
	private String pi_smssend="X";
	private String pi_secret="X";
	private String pi_state;
	private int inq_count;//문의 총 개수를 저장할 필드
	private String m_id;
}
