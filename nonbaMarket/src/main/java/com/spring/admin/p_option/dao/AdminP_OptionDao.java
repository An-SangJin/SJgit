package com.spring.admin.p_option.dao;

import java.util.List;

import com.spring.admin.p_option.vo.AdminP_OptionVO;

public interface AdminP_OptionDao {

	public int optionInsert(AdminP_OptionVO avo);
	
	public List<AdminP_OptionVO> optionList(long p_num);
	
	public int optionDelete(Integer op_num);
	
	public int productoptionDelete(List<Long> p_num);
	
	public List<Integer> searchOp_num(List<Long> p_num);
	
}