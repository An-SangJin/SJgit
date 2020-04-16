package com.spring.client.bookmark.service;

import java.util.List;

import com.spring.client.bookmark.vo.BookmarkVO;

public interface BookmarkService {
	public List<BookmarkVO> userBMKList(int m_num);
	
	public int delBMK(BookmarkVO bvo);
}
