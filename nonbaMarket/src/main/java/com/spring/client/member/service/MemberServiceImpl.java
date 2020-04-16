package com.spring.client.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.client.member.dao.MemberDao;
import com.spring.client.member.vo.MemberVO;

import lombok.Setter;

@Service
public class MemberServiceImpl implements MemberService{

	@Setter(onMethod_ = @Autowired)
	private MemberDao memberDao;
	
	@Override
	public int loginCheck(MemberVO mvo) {
		// TODO Auto-generated method stub
		int result = memberDao.loginCheck(mvo);
		
		return result;
	}

	@Override
	public int idCheck(String m_id) {
		// TODO Auto-generated method stub
		int result = memberDao.idCheck(m_id);
		
		return result;
	}

	@Override
	public int emailCheck(MemberVO mvo) {
		int result = memberDao.emailCheck(mvo);
		
		return result;
	}

	@Override
	public int phoneCheck(String m_phone) {
		int result = memberDao.phoneCheck(m_phone);
		return result;
	}

	@Override
	public int memberInsert(MemberVO mvo) {
		int result = 0;
		result = memberDao.memberInsert(mvo);
		return result;
	}

	@Override
	public MemberVO memberInfo(MemberVO mvo) {
		MemberVO info = null;
		info = memberDao.memberInfo(mvo);
		
		return info;
	}

	@Override
	public int pwdCheck(MemberVO mvo) {
		int result = memberDao.pwdCheck(mvo);
		return result;
	}

	@Override
	public MemberVO memberLookup(int m_num) {
		MemberVO mvo = memberDao.memberLookup(m_num);
		return mvo;
	}

	@Override
	public int memberUpdate(MemberVO mvo) {
		int result = memberDao.memberUpdate(mvo);
		return result;
	}

	@Override
	public int withdraw(int m_num) {
		int result = memberDao.withdraw(m_num);
		return result;
	}

	@Override
	public MemberVO userInfo(MemberVO mvo) {
		MemberVO vo = memberDao.userInfo(mvo);
		return vo;
	}
	
	
	@Override
	public MemberVO memberData(MemberVO mvo){
		MemberVO vo = memberDao.memberData(mvo);
		return vo;
	}
	
	@Override
	public int memberUpdate2(MemberVO mvo) {
		int result = 0;
		
		result = memberDao.memberUpdate2(mvo);
		
		return result;
	}
	
	@Override
	public int phoneCheck2(MemberVO mvo) {
		int result = 0;
		
		result = memberDao.phoneCheck2(mvo);
		
		return result;
	}
}
