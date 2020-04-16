package com.spring.client.product.vo;

import lombok.Data;

@Data
public class P_optionVO {
	private int op_num;
	private long p_num;
	private String op_name;
	private int op_price;
	private int op_sale;
	private int op_stock;
}
