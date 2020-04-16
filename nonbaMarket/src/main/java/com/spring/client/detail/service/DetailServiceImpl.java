package com.spring.client.detail.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.client.detail.dao.DetailDao;
import com.spring.client.detail.vo.DetailVO;

import lombok.Setter;

@Service
public class DetailServiceImpl implements DetailService{
	
	@Setter(onMethod_ = @Autowired)
	private DetailDao detailDao;
	
	@Override
	public List<DetailVO> getDetail(int o_num) {
		List<DetailVO> dvo = detailDao.getDetail(o_num);
		return dvo;
	}

	@Override
	public String reviewBeforeList(int m_num) {
		List<DetailVO> list = null;
		ObjectMapper mapper = new ObjectMapper();
		String listData = "";
		try {
			list = detailDao.reviewBeforeList(m_num);
			listData = mapper.writeValueAsString(list);
		}
		catch(JsonProcessingException e) {
			e.printStackTrace();
		}
		return listData;
	}

	@Override
	public DetailVO reviewCnt(int m_num) {
		DetailVO dvo = null;
		dvo = detailDao.reviewCnt(m_num);
		return dvo;
	}

	@Override
	public int insertDetail(DetailVO dvo) {
		int result = detailDao.insertDetail(dvo);
		return result;
	}

	@Override
	public int reviewAfterUpdate(int d_num) {
		int result = detailDao.reviewAfterUpdate(d_num);
		return result;
	}

}
