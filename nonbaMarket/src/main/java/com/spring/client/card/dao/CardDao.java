package com.spring.client.card.dao;

import java.util.List;

import com.spring.client.card.vo.CardVO;

public interface CardDao {
	public List<CardVO> cardData(CardVO cvo);
	public int cardCheck(CardVO cvo);
}
