package com.spring.client.qna.service;

import java.util.List;

import com.spring.client.member.vo.MemberVO;
import com.spring.client.qna.vo.QnaVO;


public interface QnaService {
	public List<QnaVO> qnaList(QnaVO qvo);
	
	
	//페이징 처리
	public int qnaListCnt(QnaVO qvo);
	
	
	//주문조회 리스트 가져오기
	public List<QnaVO> qnaInsert(QnaVO qvo);
	
	
	//입력창에 회원정보 가져오기
	public MemberVO emailphone(MemberVO mvo);
	
	
	//입력
	public int qnaupload(QnaVO qvo);
	
	
	//수정창에 게시글 정보 가져오기
	public QnaVO qinfo(QnaVO qvo);
	
	
	//수정
	public int qnaUpdate(QnaVO qvo);
	
	
	//삭제
	public int qnaDelete(QnaVO qvo);
}
