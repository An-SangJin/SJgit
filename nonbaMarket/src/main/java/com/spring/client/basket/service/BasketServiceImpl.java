package com.spring.client.basket.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.client.basket.dao.BasketDao;
import com.spring.client.basket.vo.BasketVO;
import com.spring.client.bookmark.vo.BookmarkVO;

import lombok.Setter;

@Service
public class BasketServiceImpl implements BasketService {

	@Setter(onMethod_ = @Autowired)
	private BasketDao basketDao;
	
	@Override
	public int addBasket(BookmarkVO bvo) {
		int result = basketDao.addBasket(bvo);
		
		return result;
	}

	
	@Override
	public List<BasketVO> basketList(BasketVO bvo) {
		
		List<BasketVO> list = null;
		
		list = basketDao.basketList(bvo);
		
		return list;
	}
	
	@Override
	public int basketUpdate(BasketVO bvo) {
		
		int result = 0;
		result = basketDao.basketUpdate(bvo);
				
		return result;
	}
	
	@Override
	public BasketVO basketTotalList(BasketVO bvo) {
		BasketVO list = null;
		list = basketDao.basketTotalList(bvo);
		return list;
	}
	
	@Override
	public int basketDelete(BasketVO bvo) {
		
		int result = 0;
		
		result = basketDao.basketDelete(bvo);
		
		return result;
	}
	
	@Override
	   public int basketAllDelete(BasketVO bvo) {
	      
	      int result = 0;
	      
	      result = basketDao.basketAllDelete(bvo);
	      
	      return result;
	   }
	
}
