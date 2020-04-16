package com.spring.admin.faq.dao;

import java.util.List;

import com.spring.admin.faq.vo.AdminFaqVO;

public interface AdminFaqDao {
	public List<AdminFaqVO> faqList(AdminFaqVO afvo);
	
	public int deleteFaq(int f_num);
	
	public int updateFaq(AdminFaqVO afvo);
	
	public int insertFaq(AdminFaqVO afvo);
}
