package com.spring.client.member.service;

import com.spring.client.member.vo.MemberVO;

public interface MemberService {
	public int loginCheck(MemberVO mvo);
	
	public int idCheck(String m_id);
	
	public int emailCheck(MemberVO mvo);
	
	public int phoneCheck(String m_phone);
	
	public int memberInsert(MemberVO mvo);
	
	//회원정보 하나 가져오기
	public MemberVO memberInfo(MemberVO mvo);
	
	public int pwdCheck(MemberVO mvo);
	
	public MemberVO memberLookup(int m_num);
	
	public int memberUpdate(MemberVO mvo);
	
	public int withdraw(int m_num);
	
	public MemberVO userInfo(MemberVO mvo);
	
	public MemberVO memberData(MemberVO mvo);
	public int memberUpdate2(MemberVO mvo);
	public int phoneCheck2(MemberVO mvo);
}
