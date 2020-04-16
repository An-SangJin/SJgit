package com.spring.client.basket.dao;

import java.util.List;

import com.spring.client.basket.vo.BasketVO;
import com.spring.client.bookmark.vo.BookmarkVO;

public interface BasketDao {
	public int addBasket(BookmarkVO bvo);
	
	
	public int goBasket(BasketVO bvo);
	
	public List<BasketVO> basketList(BasketVO bvo);
	public int basketUpdate(BasketVO bvo);
	public BasketVO basketTotalList(BasketVO bvo);
	public int basketDelete(BasketVO bvo);
	
	 public int basketAllDelete(BasketVO bvo);
}
