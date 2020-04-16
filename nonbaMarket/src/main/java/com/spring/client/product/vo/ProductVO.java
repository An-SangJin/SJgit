package com.spring.client.product.vo;


import com.spring.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class ProductVO extends CommonVO {
	private String num;
	private long p_num;
	private int lc_num;
	private int mc_num;
	private String p_name;
	private String p_price;
	private String p_explain_img;
	private String p_img;
	private String p_regdate;
	private String p_option;
	private String sales_unit;
	private String p_weight;
	private String p_origin;
	private String p_announce;
	private int p_stock;
	private int p_sale;
	private String p_display;
	private String cnt;
}
