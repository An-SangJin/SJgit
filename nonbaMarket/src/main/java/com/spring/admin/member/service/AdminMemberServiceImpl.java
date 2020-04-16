package com.spring.admin.member.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.admin.member.dao.AdminMemberDao;
import com.spring.admin.member.vo.AdminMemberVO;
import com.spring.admin.product_inq.vo.AdminProduct_inqVO;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class AdminMemberServiceImpl implements AdminMemberService {

	private AdminMemberDao adminMemberDao;

	@Override
	public List<AdminMemberVO> memberList(AdminMemberVO avo) {
		
		List<AdminMemberVO> list = adminMemberDao.memberList(avo);
		
		return list;
	}
	
	public int countMemberList(AdminMemberVO avo) {
		int result = adminMemberDao.countMemberList(avo);
		
		return result;
		
	}
	
	public List<AdminMemberVO> memberExcel(AdminMemberVO avo){
		
		List<AdminMemberVO> list =adminMemberDao.memberExcel(avo);
		
		return list;
				
	}
	
	@Override
	public AdminMemberVO getRealEmailPhone(AdminProduct_inqVO apvo) {
		AdminMemberVO vo = adminMemberDao.getRealEmailPhone(apvo);
		return vo;
	}
}
