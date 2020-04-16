package com.spring.client.bookmark.dao;

import java.util.List;

import com.spring.client.bookmark.vo.BookmarkVO;

public interface BookmarkDao {
	public List<BookmarkVO> userBMKList(int m_num);
	
	public int delBMK(BookmarkVO bvo);
	
	public List<BookmarkVO> productEnjoy(BookmarkVO vo);
	public int bookMarkInsert(BookmarkVO vo);
	public int bookMarkInsert2(BookmarkVO vo);
	
}
