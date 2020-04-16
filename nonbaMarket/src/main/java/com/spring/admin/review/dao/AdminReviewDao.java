package com.spring.admin.review.dao;

import java.util.List;

import com.spring.admin.review.vo.AdminReviewVO;

public interface AdminReviewDao {
	public List<AdminReviewVO> reviewList(AdminReviewVO arvo);
	
	public int deleteReview(int re_num);
}
