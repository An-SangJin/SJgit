package com.spring.admin.review.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.admin.review.dao.AdminReviewDao;
import com.spring.admin.review.vo.AdminReviewVO;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class AdminReviewServiceImpl implements AdminReviewService {

	private AdminReviewDao adminReviewDao;

	@Override
	public String reviewList(AdminReviewVO arvo) {
		String listData = "";
		List<AdminReviewVO> list = null;
		ObjectMapper mapper = new ObjectMapper();
		try {
			list = adminReviewDao.reviewList(arvo);
			listData = mapper.writeValueAsString(list);
		}
		catch(JsonProcessingException e) {
			e.printStackTrace();
		}
		return listData;
	}

	@Override
	public int deleteReview(int re_num) {
		int result = adminReviewDao.deleteReview(re_num);
		return result;
	}
	
	
}
