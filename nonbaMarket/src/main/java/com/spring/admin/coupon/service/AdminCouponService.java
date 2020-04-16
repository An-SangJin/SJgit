package com.spring.admin.coupon.service;


import com.spring.admin.coupon.vo.AdminCouponVO;

public interface AdminCouponService {
	public String couponList(AdminCouponVO cvo);
	
	public int deleteCoupon(int c_num);
	
	public int insertCoupon(AdminCouponVO avo);
}
