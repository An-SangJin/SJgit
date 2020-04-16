package com.spring.client.card.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.client.card.dao.CardDao;
import com.spring.client.card.vo.CardVO;

import lombok.Setter;

@Service
public class CardServiceImpl implements CardService{
	@Setter(onMethod_ = @Autowired)
	private CardDao cardDao;
	
	@Override
	public List<CardVO> cardData(CardVO cvo) {
		List<CardVO> clist = null;
		
		clist = cardDao.cardData(cvo);
		
		return clist;
	}
	
	@Override
	public int cardCheck(CardVO cvo) {
		int result = 0;
		
		result = cardDao.cardCheck(cvo); 
				
		return result;
	}
}
