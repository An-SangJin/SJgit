package com.spring.client.qna.dao;

import java.util.List;

import com.spring.client.member.vo.MemberVO;
import com.spring.client.qna.vo.QnaVO;

public interface QnaDao {
	
	public List<QnaVO> qnaList(QnaVO qvo);
	
	public int qnaListCnt(QnaVO qvo);
	
	public List<QnaVO> qnaInsert(QnaVO qvo);
	
	public MemberVO emailphone(MemberVO mvo);
	
	public int qnaupload(QnaVO qvo);
	
	public QnaVO qinfo(QnaVO qvo);
	
	public int qnaUpdate(QnaVO qvo);
	
	public int qnaDelete(int q_num);
}
