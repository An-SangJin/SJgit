package com.spring.admin.notice.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.admin.notice.dao.AdminNoticeDao;
import com.spring.admin.notice.vo.AdminNoticeVO;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class AdminNoticeServiceImple implements AdminNoticeService {

	private AdminNoticeDao adminNoticedao;
	
	@Override
	public String noticeList(AdminNoticeVO anvo) {
		String listData = "";
		List<AdminNoticeVO> list = null;
		ObjectMapper mapper = new ObjectMapper();
		try {
			list = adminNoticedao.noticeList(anvo);
			listData = mapper.writeValueAsString(list);
		}
		catch(JsonProcessingException e) {
			e.printStackTrace();
		}
		
		return listData;
	}

	@Override
	public int deleteNotice(int n_num) {
		int result = 0;
		result = adminNoticedao.deleteNotice(n_num);
		return result;
	}

	@Override
	public int updateNotice(AdminNoticeVO anvo) {
		int result = 0;
		result = adminNoticedao.updateNotice(anvo);
		return result;
	}

	@Override
	public int insertNotice(AdminNoticeVO anvo) {
		int result = 0;
		result = adminNoticedao.insertNotice(anvo);
		return result;
	}

}
