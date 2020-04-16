package com.spring.admin.product_inq.dao;

import java.util.List;

import com.spring.admin.product_inq.vo.AdminProduct_inqVO;

public interface AdminProduct_inqDao {
	public List<AdminProduct_inqVO> product_inqList(AdminProduct_inqVO apvo);
	
	public int deleteProduct_inq(int pi_num);
	
	public int insertReply(AdminProduct_inqVO apvo);
	
	public int replyProcess(AdminProduct_inqVO apvo);
	
	public AdminProduct_inqVO replyLookup(AdminProduct_inqVO apvo);
}
