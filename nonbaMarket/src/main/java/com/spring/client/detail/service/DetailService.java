package com.spring.client.detail.service;

import java.util.List;

import com.spring.client.detail.vo.DetailVO;

public interface DetailService {
	public List<DetailVO> getDetail(int o_num);
	
	public String reviewBeforeList(int m_num);
	
	public DetailVO reviewCnt(int m_num);
	
	public int insertDetail(DetailVO dvo);
	
	public int reviewAfterUpdate(int d_num);
}
