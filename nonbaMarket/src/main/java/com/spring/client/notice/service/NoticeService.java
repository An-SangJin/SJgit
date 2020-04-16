package com.spring.client.notice.service;

import java.util.List;

import com.spring.client.notice.vo.NoticeVO;

public interface NoticeService {
	
	public List<NoticeVO> noticeList(NoticeVO nvo);
	
	//조회수
	public int noticeCnt(NoticeVO nvo);
	
	//페이징
	public int noticeListCnt(NoticeVO nvo);
}
