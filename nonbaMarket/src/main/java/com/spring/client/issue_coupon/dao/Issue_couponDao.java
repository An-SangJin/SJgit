package com.spring.client.issue_coupon.dao;

import java.util.List;

import com.spring.client.issue_coupon.vo.Issue_couponVO;

public interface Issue_couponDao {
	public List<Issue_couponVO> couponList(int m_num);
	
	
	public List<Issue_couponVO> couponList2(Issue_couponVO ivo); 
	
	public int couponUpdate(Issue_couponVO ivo);
}
