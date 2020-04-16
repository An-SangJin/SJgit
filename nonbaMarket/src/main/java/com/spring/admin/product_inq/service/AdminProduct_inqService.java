package com.spring.admin.product_inq.service;

import com.spring.admin.product_inq.vo.AdminProduct_inqVO;

public interface AdminProduct_inqService {
	public String product_inqList(AdminProduct_inqVO apvo);
	
	public int deleteProduct_inq(int pi_num);
	
	public int insertReply(AdminProduct_inqVO apvo);
	
	public int replyProcess(AdminProduct_inqVO apvo);
	
	public String replyLookup(AdminProduct_inqVO apvo);
}
