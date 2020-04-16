package com.spring.admin.coupon.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.admin.coupon.dao.AdminCouponDao;
import com.spring.admin.coupon.vo.AdminCouponVO;
import com.spring.admin.issue_coupon.dao.AdminIssue_couponDao;
import com.spring.admin.issue_coupon.vo.AdminIssue_couponVO;

import lombok.Setter;

@Service
public class AdminCouponServiceImpl implements AdminCouponService{
	
	@Setter(onMethod_ = @Autowired)
	private AdminCouponDao adminCouponDao;
	

	
	@Override
	public String couponList(AdminCouponVO cvo) {
		String result="";
		List<AdminCouponVO> list = null;
		ObjectMapper mapper = new ObjectMapper();
		try {
			list = adminCouponDao.couponList(cvo);
			result = mapper.writeValueAsString(list);
		}
		catch(JsonProcessingException ex) {
			ex.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int deleteCoupon(int c_num) {
		List<AdminIssue_couponVO> list = adminCouponDao.delIssueList(c_num);
		if(list.size()!=0) {
			for(AdminIssue_couponVO avo : list) {
				adminCouponDao.deleteOrdersCoupon(avo);
			}
			
			for(AdminIssue_couponVO avo : list) {
				adminCouponDao.deleteIssueCoupon(avo);
			}
		}
	
		
		int result = adminCouponDao.deleteCoupon(c_num);
		
		return result;
	}

	@Override
	public int insertCoupon(AdminCouponVO avo) {
		int result = adminCouponDao.insertCoupon(avo);
		return result;
	}


	
}
