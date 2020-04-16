package com.spring.client.product_inq.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.spring.client.product_inq.dao.Product_inqDao;
import com.spring.client.product_inq.vo.Product_inqVO;

import lombok.Setter;

@Service
public class Product_inqServiceImpl implements Product_inqService {
	
	@Setter(onMethod_ = @Autowired)
	private Product_inqDao inqDao;
	
	@Override
	public List<Product_inqVO> inqList2(Product_inqVO ivo) {
		List<Product_inqVO> list = null;
		list = inqDao.inqList2(ivo);
		
		List<Product_inqVO> listno = new ArrayList<Product_inqVO>();
		if(list != null) {
			for(Product_inqVO no : list) {
				no.setPi_content(no.getPi_content().toString().replaceAll("\n", "<br>"));
				listno.add(no);
			}
				
		}

		return listno;
		
	}

	@Override
	public int inq_ListCnt(Product_inqVO ivo) {
	
		return inqDao.inq_ListCnt(ivo);
	}

	

}
