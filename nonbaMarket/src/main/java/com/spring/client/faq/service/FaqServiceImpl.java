package com.spring.client.faq.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

//import com.fasterxml.jackson.core.JsonProcessingException;
//import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.client.faq.dao.FaqDao;
import com.spring.client.faq.vo.FaqVO;


import lombok.Setter;
import lombok.extern.log4j.Log4j;
@Log4j
@Service
public class FaqServiceImpl implements FaqService {
	
	@Setter(onMethod_ = @Autowired)
	private FaqDao faqDao;

	@Override
	public List<FaqVO> faqList(FaqVO fvo) {
		List<FaqVO> list = null;
		list = faqDao.faqList(fvo);
		log.info(fvo);
		List<FaqVO> listno = new ArrayList<FaqVO>();
		if(list != null) {
			for(FaqVO no : list) {
				no.setF_content(no.getF_content().toString().replaceAll("\n", "<br>"));
				listno.add(no);
			}
		
		}
		return listno;
	}
	
	
	
	@Override
	public int faqListCnt(FaqVO fvo) {
		
		return faqDao.faqListCnt(fvo);
	}
	
	
}
