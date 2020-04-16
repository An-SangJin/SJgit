package com.spring.admin.notice.dao;

import java.util.List;

import com.spring.admin.notice.vo.AdminNoticeVO;

public interface AdminNoticeDao {
	public List<AdminNoticeVO> noticeList(AdminNoticeVO anvo);
	
	public int deleteNotice(int n_num);
	
	public int updateNotice(AdminNoticeVO anvo);
	
	public int insertNotice(AdminNoticeVO anvo);
}
