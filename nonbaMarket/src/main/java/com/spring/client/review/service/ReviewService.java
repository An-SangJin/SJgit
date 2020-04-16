package com.spring.client.review.service;

import java.util.List;

import com.spring.client.qna.vo.QnaVO;
import com.spring.client.review.vo.ReviewVO;

public interface ReviewService {
	public String reviewAfterList(int m_num);
	
	public int reviewInsert(ReviewVO rvo);
	
	public int reviewUpdate(ReviewVO rvo);
	
	public int reviewDelete(String re_num);
	
	public ReviewVO reviewSearch(String re_num);
	
	
	
	
	public List<ReviewVO> reviewList2(ReviewVO rvo);
	
	public int reviewCnt(ReviewVO rvo);
	
	public int reviewListCnt2(ReviewVO rvo);
	
	public int reviewConfirm(ReviewVO rvo);
	
	public List<QnaVO> revieworderList(QnaVO qvo);
	
	//입력
	public int reviewupload(ReviewVO rvo);
	//입력과 동시에 후기 입력 상태 업데이트
	public int detailupdate(ReviewVO rvo);
}
