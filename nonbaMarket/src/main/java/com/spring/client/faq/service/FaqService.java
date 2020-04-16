package com.spring.client.faq.service;

import java.util.List;


import com.spring.client.faq.vo.FaqVO;


public interface FaqService {
	
	public List<FaqVO> faqList(FaqVO fvo);
	
	/* public String selectList(FaqVO fvo); */
	
	public int faqListCnt(FaqVO fvo); 
	
}
