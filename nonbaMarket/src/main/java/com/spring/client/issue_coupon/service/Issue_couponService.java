package com.spring.client.issue_coupon.service;

import java.util.List;

import com.spring.client.issue_coupon.vo.Issue_couponVO;

public interface Issue_couponService {
	public String couponList(int m_num);
	
	public List<Issue_couponVO> couponList2(Issue_couponVO ivo); 
	
	public int couponUpdate(Issue_couponVO ivo);
}
