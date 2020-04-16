package com.spring.admin.qna.dao;

import java.util.List;

import com.spring.admin.qna.vo.AdminQnaVO;

public interface AdminQnaDao {
	public List<AdminQnaVO> qnaList(AdminQnaVO aqvo);
	
	public int deleteQna(int q_num);
	
	public int replyProcess(AdminQnaVO aqvo);
	
	public AdminQnaVO getRealEmailPhone(AdminQnaVO aqvo);
}
