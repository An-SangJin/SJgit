package com.spring.client.pointstatus.service;

import com.spring.client.pointstatus.vo.PointStatusVO;

public interface PointStatusService {
	public PointStatusVO userPointInfo(int m_num);
	
	public String pointList(int m_num);
	
	public int pointInsert(PointStatusVO pvo);
}
