package com.spring.admin.review.service;

import com.spring.admin.review.vo.AdminReviewVO;

public interface AdminReviewService {
	public String reviewList(AdminReviewVO arvo);
	
	public int deleteReview(int re_num);
}
