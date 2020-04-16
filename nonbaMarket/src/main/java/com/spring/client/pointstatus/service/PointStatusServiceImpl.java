package com.spring.client.pointstatus.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.client.pointstatus.dao.PointStatusDao;
import com.spring.client.pointstatus.vo.PointStatusVO;

import lombok.Setter;

@Service
public class PointStatusServiceImpl implements PointStatusService {

	@Setter(onMethod_ = @Autowired)
	private PointStatusDao pointStatusDao;
	
	@Override
	public PointStatusVO userPointInfo(int m_num) {
		PointStatusVO pvo = null;
		pvo = pointStatusDao.userPointInfo(m_num);
		return pvo;
	}

	@Override
	public String pointList(int m_num) {
		List<PointStatusVO> list = null;
		String listData ="";
		ObjectMapper mapper = new ObjectMapper();
		try {
			list = pointStatusDao.pointList(m_num);
			listData = mapper.writeValueAsString(list);
		}
		catch(JsonProcessingException e) {
			e.printStackTrace();
		}
		
		return listData;
	}

	
	
	
	@Override
	public int pointInsert(PointStatusVO pvo) {
		int result = 0;
		result = pointStatusDao.pointInsert(pvo);
		return result;
	}

}
