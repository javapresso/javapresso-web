package com.javapresso.handler.order;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javapresso.dao.OrderDao;
import com.javapresso.dto.OrderDto;
import com.javapresso.handler.CommandHandler;

public class OrderSelectHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// 주문내역 확인 페이지
		OrderDao dao = new OrderDao();
		OrderDto orderList = new OrderDto();
		orderList = dao.getOrderList();
		request.setAttribute("orderList", orderList);
		request.setAttribute("action", "select");

		return "order/select.jsp";
	}

}
