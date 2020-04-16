package com.spring.admin.coupon.dao;

import java.util.List;

import com.spring.admin.coupon.vo.AdminCouponVO;
import com.spring.admin.issue_coupon.vo.AdminIssue_couponVO;

public interface AdminCouponDao {
	public List<AdminCouponVO> couponList(AdminCouponVO cvo);
	
	public int deleteCoupon(int c_num);
	
	public List<AdminIssue_couponVO> delIssueList(int c_num);
	
	public int deleteOrdersCoupon(AdminIssue_couponVO avo);
	
	public int deleteIssueCoupon(AdminIssue_couponVO avo);
	
	public int insertCoupon(AdminCouponVO avo);
	
}
