package com.spring.client.review.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.client.qna.vo.QnaVO;
import com.spring.client.review.dao.ReviewDao;
import com.spring.client.review.vo.ReviewVO;
import com.spring.common.file.FileUploadUtil;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReviewServiceImpl implements ReviewService {

	@Setter(onMethod_ = @Autowired)
	private ReviewDao reviewDao;
	
	@Override
	public String reviewAfterList(int m_num) {
		List<ReviewVO> list = null;
		ObjectMapper mapper = new ObjectMapper();
		String listData ="";
		try {
			list = reviewDao.reviewAfterList(m_num);
			for(ReviewVO rvo : list) {
				rvo.setRe_content(rvo.getRe_content().toString().replaceAll("\n", "<br>"));;
			}
			listData = mapper.writeValueAsString(list);
			log.info(listData);
		}
		catch(JsonProcessingException e) {
			e.printStackTrace();
		}
		
		return listData;
	}

	@Override
	public int reviewInsert(ReviewVO rvo) {
		int result =0;
		try {
			if(rvo.getFile()!=null) {
				String fileName = FileUploadUtil.fileUpload(rvo.getFile(), "review");
				rvo.setRe_img(fileName);
				
			}
			else {
				rvo.setRe_img("");
			}
			result = reviewDao.reviewInsert(rvo);
		}
		catch(Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

	@Override
	public int reviewUpdate(ReviewVO rvo) {
		int result = 0;
		try {
			if(rvo.getFile()!=null) {
				ReviewVO vo = reviewDao.reviewSearch(rvo.getRe_num());
				if(vo!=null) {
					if(vo.getRe_img()!=null) {
						FileUploadUtil.fileDelete(vo.getRe_img());
					}
				}
				String fileName = FileUploadUtil.fileUpload(rvo.getFile(), "review");
				rvo.setRe_img(fileName);
				
			}
			else {
				rvo.setRe_img("");
			}
			result = reviewDao.reviewUpdate(rvo);
		}
		catch(Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

	@Override
	public int reviewDelete(String re_num) {
		int result = 0;
		try {
			ReviewVO rvo = reviewDao.reviewSearch(re_num);
			if(rvo.getRe_img()!=null) {
				FileUploadUtil.fileDelete(rvo.getRe_img());				
			}
			result = reviewDao.reviewDelete(re_num);
		}
		catch(Exception e) {
			e.printStackTrace();
			result=0;
		}
		return result;
	}

	@Override
	public ReviewVO reviewSearch(String re_num) {
		ReviewVO rvo = reviewDao.reviewSearch(re_num);
		return rvo;
	}

	

	
	
	
	
	
	
	@Override
	public List<ReviewVO> reviewList2(ReviewVO rvo) {
		List<ReviewVO> list = null;
		list = reviewDao.reviewList2(rvo);
		List<ReviewVO> listno = new ArrayList<ReviewVO>();
		if(list != null) {
			for(ReviewVO no : list) {
				no.setRe_content(no.getRe_content().toString().replaceAll("\n", "<br>"));
				listno.add(no);
			}
				
		}

		return listno;
		
	}

	@Override
	public int reviewCnt(ReviewVO rvo) {
		int cnt = 0;
		cnt = reviewDao.reviewCnt(rvo);
		return cnt;
	}

	@Override
	public int reviewListCnt2(ReviewVO rvo) {
		
		return reviewDao.reviewListCnt2(rvo);
	}

	@Override
	public int reviewConfirm(ReviewVO rvo) {
		
		return reviewDao.reviewConfirm(rvo);
	}

	
	@Override
	public List<QnaVO> revieworderList(QnaVO qvo) {
		List<QnaVO> list = null;
		list = reviewDao.revieworderList(qvo);
		return list;
	}

	@Override
	public int reviewupload(ReviewVO rvo) {
		int result = 0;
	
		try {
			if(rvo.getFile()!=null) {
				String fileName = FileUploadUtil.fileUpload(rvo.getFile(), "review");
				rvo.setRe_img(fileName);
			}
			else {
				rvo.setRe_img("");
			}
			result = reviewDao.reviewupload(rvo);
		}catch(Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}
		


	@Override
	public int detailupdate(ReviewVO rvo) {
		int result = 0;
		result = reviewDao.detailupdate(rvo);
		
		return result;
	}
}
