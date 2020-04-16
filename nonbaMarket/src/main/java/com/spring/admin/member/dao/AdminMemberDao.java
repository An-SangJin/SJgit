package com.spring.admin.member.dao;

import java.util.List;

import com.spring.admin.member.vo.AdminMemberVO;
import com.spring.admin.product_inq.vo.AdminProduct_inqVO;

public interface AdminMemberDao {
	
	public List<AdminMemberVO> memberList(AdminMemberVO avo);
	
	public int countMemberList(AdminMemberVO avo);
	
	public List<AdminMemberVO> memberExcel(AdminMemberVO avo);
	
	public AdminMemberVO getRealEmailPhone(AdminProduct_inqVO apvo);

	public List<AdminMemberVO> gradeMemberList(int g_num);
}
