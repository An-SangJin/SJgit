package com.spring.admin.issue_coupon.service;


import com.spring.admin.issue_coupon.vo.AdminIssue_couponVO;

public interface AdminIssue_couponService {
	public String issue_couponList(AdminIssue_couponVO avo);
	
	public int deleteIssue_coupon(AdminIssue_couponVO cvo);
	
	public String insertIssue_coupon(int c_num, int g_num);
}
