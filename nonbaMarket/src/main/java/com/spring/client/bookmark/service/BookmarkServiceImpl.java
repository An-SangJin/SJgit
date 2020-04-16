package com.spring.client.bookmark.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.client.bookmark.dao.BookmarkDao;
import com.spring.client.bookmark.vo.BookmarkVO;

import lombok.Setter;

@Service
public class BookmarkServiceImpl implements BookmarkService {

	@Setter(onMethod_ = @Autowired)
	private BookmarkDao bookmarkDao;
	
	@Override
	public List<BookmarkVO> userBMKList(int m_num) {
		List<BookmarkVO> list = bookmarkDao.userBMKList(m_num);
		return list;
	}

	@Override
	public int delBMK(BookmarkVO bvo) {
		int result = bookmarkDao.delBMK(bvo);
		return result;
	}

}
