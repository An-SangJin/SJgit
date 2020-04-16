package com.spring.client.card.service;

import java.util.List;

import com.spring.client.card.vo.CardVO;

public interface CardService {
	public List<CardVO> cardData(CardVO cvo);
	
	public int cardCheck(CardVO cvo);
}
