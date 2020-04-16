package com.spring.admin.issue_coupon.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.admin.issue_coupon.dao.AdminIssue_couponDao;
import com.spring.admin.issue_coupon.vo.AdminIssue_couponVO;
import com.spring.admin.member.dao.AdminMemberDao;
import com.spring.admin.member.vo.AdminMemberVO;

import lombok.Setter;

@Service
public class AdminIssue_couponServiceImpl implements AdminIssue_couponService {

	@Setter(onMethod_ = @Autowired)
	private AdminIssue_couponDao adminIssue_couponDao;
	
	@Setter(onMethod_ = @Autowired)
	private AdminMemberDao adminMemberDao;
	
	@Override
	public String issue_couponList(AdminIssue_couponVO avo) {
		List<AdminIssue_couponVO> list = null;
		ObjectMapper mapper = new ObjectMapper();
		String result = "";
		try {
			list = adminIssue_couponDao.issue_couponList(avo);
			result = mapper.writeValueAsString(list);
		}
		catch(JsonProcessingException e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int deleteIssue_coupon(AdminIssue_couponVO cvo) {
		adminIssue_couponDao.deleteDetailCoupon(cvo);
		int result = adminIssue_couponDao.deleteIssue_coupon(cvo);
		return result;
	}

	@Override
	public String insertIssue_coupon(int c_num, int g_num) {
		List<AdminMemberVO> list = adminMemberDao.gradeMemberList(g_num);
		int result = 0;
		AdminIssue_couponVO cvo = new AdminIssue_couponVO();
		cvo.setC_num(c_num);
		for(AdminMemberVO mvo : list) {
			cvo.setM_num(mvo.getM_num());
			result += adminIssue_couponDao.insertIssue_coupon(cvo);
		}
		if(result == list.size()) {
			return "SUCCESS";
		}
		else {
			return "FAIL";
		}
		
		
	}

}
