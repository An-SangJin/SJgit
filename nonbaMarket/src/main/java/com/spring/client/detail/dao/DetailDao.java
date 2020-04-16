package com.spring.client.detail.dao;

import java.util.List;

import com.spring.client.detail.vo.DetailVO;

public interface DetailDao {
	public List<DetailVO> getDetail(int o_num);
	
	public List<DetailVO> reviewBeforeList(int m_num);
	
	public DetailVO reviewCnt(int m_num);
	
	public int insertDetail(DetailVO dvo);

	public int reviewAfterUpdate(int d_num);
}
