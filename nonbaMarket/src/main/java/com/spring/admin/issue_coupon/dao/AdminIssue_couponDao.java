package com.spring.admin.issue_coupon.dao;

import java.util.List;

import com.spring.admin.coupon.vo.AdminCouponVO;
import com.spring.admin.issue_coupon.vo.AdminIssue_couponVO;

public interface AdminIssue_couponDao {
	public List<AdminIssue_couponVO> issue_couponList(AdminIssue_couponVO avo);
	
	public int deleteIssue_coupon(AdminIssue_couponVO cvo);
	
	public int deleteDetailCoupon(AdminIssue_couponVO cvo);

	
	public int insertIssue_coupon(AdminIssue_couponVO cvo);
}
