package com.spring.client.pointstatus.dao;

import java.util.List;

import com.spring.client.pointstatus.vo.PointStatusVO;

public interface PointStatusDao {
	public PointStatusVO userPointInfo(int m_num);
	
	public List<PointStatusVO> pointList(int m_num);
	
	public int pointInsert(PointStatusVO pvo);
}
