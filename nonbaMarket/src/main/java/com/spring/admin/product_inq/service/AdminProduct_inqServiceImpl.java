package com.spring.admin.product_inq.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.admin.product_inq.dao.AdminProduct_inqDao;
import com.spring.admin.product_inq.vo.AdminProduct_inqVO;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class AdminProduct_inqServiceImpl implements AdminProduct_inqService {

	private AdminProduct_inqDao adminProduct_inqDao;

	@Override
	public String product_inqList(AdminProduct_inqVO apvo) {
		String listData = "";
		List<AdminProduct_inqVO> list = null;
		ObjectMapper mapper = new ObjectMapper();
		try {
			list = adminProduct_inqDao.product_inqList(apvo);
			listData = mapper.writeValueAsString(list);
		}
		catch(JsonProcessingException e) {
			e.printStackTrace();
		}
		
		return listData;
	}

	@Override
	public int deleteProduct_inq(int pi_num) {
		int result = adminProduct_inqDao.deleteProduct_inq(pi_num);
		return result;
	}

	@Override
	public int insertReply(AdminProduct_inqVO apvo) {
		int result= adminProduct_inqDao.insertReply(apvo);
		return result;
	}

	@Override
	public int replyProcess(AdminProduct_inqVO apvo) {
		int result = adminProduct_inqDao.replyProcess(apvo);
		return result;
	}

	@Override
	public String replyLookup(AdminProduct_inqVO apvo) {
		String data = "";
		AdminProduct_inqVO vo = null;
		ObjectMapper mapper = new ObjectMapper();
		try {
			vo = adminProduct_inqDao.replyLookup(apvo);
			data = mapper.writeValueAsString(vo);
		}
		catch(JsonProcessingException e) {
			e.printStackTrace();
		}
		return data;
	}
	
}
