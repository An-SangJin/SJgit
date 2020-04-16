package com.spring.client.orders.dao;

import java.util.List;


import com.spring.client.member.vo.MemberVO;
import com.spring.client.orders.vo.OrdersVO;

public interface OrdersDao {
	public List<OrdersVO> userOrdersInfo(MemberVO mvo);
	
	public OrdersVO userOrders(int o_num);
	
	public int orderCancel(int o_num);
	
	
	
	
	public int ordersInsert(OrdersVO ovo);
	public OrdersVO ordersData(OrdersVO ovo);
	public List<OrdersVO> ordersList(OrdersVO ovo);
}
