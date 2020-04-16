package com.spring.client.issue_coupon.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.client.issue_coupon.dao.Issue_couponDao;
import com.spring.client.issue_coupon.vo.Issue_couponVO;

import lombok.AllArgsConstructor;


@Service
@AllArgsConstructor
public class Issue_couponServiceImpl implements Issue_couponService {

	private Issue_couponDao issue_couponDao;

	@Override
	public String couponList(int m_num) {
		List<Issue_couponVO> list = null;
		String listData = "";
		ObjectMapper mapper = new ObjectMapper();
		try {
			list = issue_couponDao.couponList(m_num);
			listData = mapper.writeValueAsString(list);
		}
		catch(JsonProcessingException e) {
			e.printStackTrace();
		}
		return listData;
	}

	@Override
	public List<Issue_couponVO> couponList2(Issue_couponVO ivo) {
		List<Issue_couponVO> list = null;
		list = issue_couponDao.couponList2(ivo);
		return list;
	}

	

	@Override
	public int couponUpdate(Issue_couponVO ivo) {
		int result = 0;
		result = issue_couponDao.couponUpdate(ivo);
		return result;
	}
}
