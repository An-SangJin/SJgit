package com.spring.admin.faq.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.admin.faq.dao.AdminFaqDao;
import com.spring.admin.faq.vo.AdminFaqVO;

import lombok.Setter;

@Service
public class AdminFaqServiceImpl implements AdminFaqService {
	@Setter(onMethod_ = @Autowired)
	private AdminFaqDao adminFaqDao;

	@Override
	public String faqList(AdminFaqVO afvo) {
		String listData = "";
		List<AdminFaqVO> list = null;
		ObjectMapper mapper = new ObjectMapper();
		try {
			list = adminFaqDao.faqList(afvo);
			listData = mapper.writeValueAsString(list);
		}
		catch(JsonProcessingException e) {
			e.printStackTrace();
		}
		
		return listData;
	}

	@Override
	public int deleteFaq(int f_num) {
		int result = adminFaqDao.deleteFaq(f_num);
		return result;
	}

	@Override
	public int updateFaq(AdminFaqVO afvo) {
		int result = adminFaqDao.updateFaq(afvo);
		return result;
	}

	@Override
	public int insertFaq(AdminFaqVO afvo) {
		int result = adminFaqDao.insertFaq(afvo);
		return result;
	}
}
