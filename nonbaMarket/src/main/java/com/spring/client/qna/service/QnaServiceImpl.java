package com.spring.client.qna.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.spring.client.member.vo.MemberVO;

import com.spring.client.qna.dao.QnaDao;
import com.spring.client.qna.vo.QnaVO;
import com.spring.common.file.FileUploadUtil;

import lombok.Setter;
import lombok.extern.log4j.Log4j;




@Log4j
@Service
public class QnaServiceImpl implements QnaService {
	
	@Setter(onMethod_ = @Autowired)
	private QnaDao qnaDao;

	@Override
	public List<QnaVO> qnaList(QnaVO qvo) {
		List<QnaVO> list = null;
		list = qnaDao.qnaList(qvo);
		List<QnaVO> listno = new ArrayList<QnaVO>();
		if(list != null) {
			for(QnaVO no : list) {
				no.setQ_content(no.getQ_content().toString().replaceAll("\n", "<br>"));
				listno.add(no);
			}
				
		}

		return listno;
		
	}
	@Override
	public int qnaListCnt(QnaVO qvo) {
		
		return qnaDao.qnaListCnt(qvo);
	}

	@Override
	public List<QnaVO> qnaInsert(QnaVO qvo) {
		List<QnaVO> list = null;
		list = qnaDao.qnaInsert(qvo);
		return list;
	}

	@Override
	public MemberVO emailphone(MemberVO mvo) {
		
		return qnaDao.emailphone(mvo);
	}

	@Override
	public int qnaupload(QnaVO qvo) {
		int result = 0;
		try {
			if(qvo.getFile()!=null) {
				String fileName = FileUploadUtil.fileUpload(qvo.getFile(), "upload");
				qvo.setQ_attimg(fileName);
				
//				String thumbName = FileUploadUtil.makeThumball(fileName);
//				gvo.setG_thumb(thumbName);
				
			}
			else {
				qvo.setQ_attimg("");
			}
			result = qnaDao.qnaupload(qvo);
		}catch(Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

	@Override
	public QnaVO qinfo(QnaVO qvo) {
		QnaVO data = qnaDao.qinfo(qvo);
		data.setQ_content(data.getQ_content().toString().replaceAll("\n", "<br>"));
		return data;
	}

	@Override
	public int qnaUpdate(QnaVO qvo) {
		int result = 0;
		
		try {
			if(qvo.getFile() != null) {
				if(qvo.getQ_attimg()!=null) {
					FileUploadUtil.fileDelete(qvo.getQ_attimg());
					
				}
				if(qvo.getFile()!=null) {
					String fileName = FileUploadUtil.fileUpload(qvo.getFile(), "upload");
					qvo.setQ_attimg(fileName);
					
//					String thumbName = FileUploadUtil.makeThumball(fileName);
//					gvo.setG_thumb(thumbName);
					
				}
				else {
					qvo.setQ_attimg("");
				}
				
				/*String thumbName = FileUploadUtil.makeThumball(fileName);
				gvo.setG_thumb(thumbName);*/
			}else {
				qvo.setQ_attimg("");
				/* qvo.setG_thumb(""); */
			}
			
			result = qnaDao.qnaUpdate(qvo);
		}catch(Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

	@Override
	public int qnaDelete(QnaVO qvo) {
		int result = 0;
		
		try {
			log.info("asd"+qvo.getQ_attimg());
			if(qvo.getQ_attimg()!=null) {
				FileUploadUtil.fileDelete(qvo.getQ_attimg());
			}
			
			result = qnaDao.qnaDelete(qvo.getQ_num());
			
			
			//DB의 내용물 삭제
		}catch(Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}
	
	
	
	
}
