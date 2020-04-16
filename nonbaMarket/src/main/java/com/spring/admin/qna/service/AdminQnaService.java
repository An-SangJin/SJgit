package com.spring.admin.qna.service;

import com.spring.admin.qna.vo.AdminQnaVO;

public interface AdminQnaService {
	public String qnaList(AdminQnaVO aqvo);
	
	public int deleteQna(int q_num);
	
	public int replyProcess(AdminQnaVO aqvo);
	
	public AdminQnaVO getRealEmailPhone(AdminQnaVO aqvo);
}
