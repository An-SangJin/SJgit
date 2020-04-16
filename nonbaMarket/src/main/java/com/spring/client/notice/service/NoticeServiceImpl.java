package com.spring.client.notice.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.spring.client.notice.dao.NoticeDao;
import com.spring.client.notice.vo.NoticeVO;

import lombok.Setter;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Setter(onMethod_ = @Autowired)
	private NoticeDao noticeDao;
	
	@Override
	public List<NoticeVO> noticeList(NoticeVO nvo) {
		List<NoticeVO> list = null;
		list = noticeDao.noticeList(nvo);
		
		List<NoticeVO> listno = new ArrayList<NoticeVO>();
		if(list != null) {
			for(NoticeVO no : list) {
				no.setN_content(no.getN_content().toString().replaceAll("\n", "<br>"));
				listno.add(no);
			}
				
		}

		return listno;
		
	}

	@Override
	public int noticeCnt(NoticeVO nvo) {
		int cnt = 0;
		cnt = noticeDao.noticeCnt(nvo);
		return cnt;
	}

	@Override
	public int noticeListCnt(NoticeVO nvo) {
		
		return noticeDao.noticeListCnt(nvo);
	}

}
