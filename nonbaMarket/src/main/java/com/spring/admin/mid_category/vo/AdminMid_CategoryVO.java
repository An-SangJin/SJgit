package com.spring.admin.mid_category.vo;

import com.spring.admin.common.vo.AdminCommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class AdminMid_CategoryVO extends AdminCommonVO {

	private int mc_num;
	private int lc_num;
	private String mc_name;
	
	private String mc_display;
}
