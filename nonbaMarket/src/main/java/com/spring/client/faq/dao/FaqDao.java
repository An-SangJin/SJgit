package com.spring.client.faq.dao;

import java.util.List;

import com.spring.client.faq.vo.FaqVO;

public interface FaqDao {
	
	public List<FaqVO> faqList(FaqVO fvo);
	
	 public int faqListCnt(FaqVO fvo); 
}
