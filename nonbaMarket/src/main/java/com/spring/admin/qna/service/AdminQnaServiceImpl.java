package com.spring.admin.qna.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.admin.qna.dao.AdminQnaDao;
import com.spring.admin.qna.vo.AdminQnaVO;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class AdminQnaServiceImpl implements AdminQnaService {
	
	private AdminQnaDao adminQnaDao;

	@Override
	public String qnaList(AdminQnaVO aqvo) {
		String listData = "";
		ObjectMapper mapper = new ObjectMapper();
		List<AdminQnaVO> list = null;
		try {
			list = adminQnaDao.qnaList(aqvo);
			listData = mapper.writeValueAsString(list);
		}
		catch(JsonProcessingException e) {
			e.printStackTrace();
		}
		return listData;
	}

	@Override
	public int deleteQna(int q_num) {
		int result = adminQnaDao.deleteQna(q_num);
		return result;
	}

	@Override
	public int replyProcess(AdminQnaVO aqvo) {
		int result = adminQnaDao.replyProcess(aqvo);
		return result;
	}

	@Override
	public AdminQnaVO getRealEmailPhone(AdminQnaVO aqvo) {
		AdminQnaVO vo = adminQnaDao.getRealEmailPhone(aqvo);
		return vo;
	}
	
}
