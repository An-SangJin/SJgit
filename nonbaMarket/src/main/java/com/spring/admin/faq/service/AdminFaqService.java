package com.spring.admin.faq.service;

import com.spring.admin.faq.vo.AdminFaqVO;

public interface AdminFaqService {
	public String faqList(AdminFaqVO afvo);
	
	public int deleteFaq(int f_num);
	
	public int updateFaq(AdminFaqVO afvo);
	
	public int insertFaq(AdminFaqVO afvo);
}
