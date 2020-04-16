package com.spring.client.orders.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.client.member.vo.MemberVO;
import com.spring.client.orders.dao.OrdersDao;
import com.spring.client.orders.vo.OrdersVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class OrdersServiceImpl implements OrdersService {

	@Setter(onMethod_ = @Autowired)
	private OrdersDao ordersDao;
	
	@Override
	public List<OrdersVO> userOrdersInfo(MemberVO mvo) {
		List<OrdersVO> list = null;
		list = ordersDao.userOrdersInfo(mvo);
		return list;
	}

	@Override
	public OrdersVO userOrders(int o_num) {
		OrdersVO vo = ordersDao.userOrders(o_num);
		return vo;
	}

	@Override
	public int orderCancel(int o_num) {
		int result = 0;
		result = ordersDao.orderCancel(o_num);
		return result;
	}

	

	
	
	@Override
	public int ordersInsert(OrdersVO ovo) {
		
		int result = 0;
		
		result = ordersDao.ordersInsert(ovo);
		int a = ovo.getO_num();
		log.info("a 의 값 : "+a);

		return a;
	}
	
	@Override
	public OrdersVO ordersData(OrdersVO ovo) {
		OrdersVO oData = null;
		oData = ordersDao.ordersData(ovo);
		return oData;
	}
	
	@Override
	public List<OrdersVO> ordersList(OrdersVO ovo) {
		List<OrdersVO> oList = null;
		
		oList = ordersDao.ordersList(ovo);
		
		return oList;
	}
}
