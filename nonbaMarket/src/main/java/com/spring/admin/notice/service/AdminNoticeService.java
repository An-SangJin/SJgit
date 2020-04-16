package com.spring.admin.notice.service;

import com.spring.admin.notice.vo.AdminNoticeVO;

public interface AdminNoticeService {
	public String noticeList(AdminNoticeVO anvo);
	
	public int deleteNotice(int n_num);
	
	public int updateNotice(AdminNoticeVO anvo);
	
	public int insertNotice(AdminNoticeVO anvo);
}
