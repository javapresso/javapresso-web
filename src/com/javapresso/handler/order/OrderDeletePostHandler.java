package com.javapresso.handler.order;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javapresso.dao.OrderDao;
import com.javapresso.handler.CommandHandler;

public class OrderDeletePostHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// 주문내역 삭제 페이지
		OrderDao dao = new OrderDao();
		String id = request.getParameter("id");
		dao.deleteOrderById(Integer.parseInt(id));
		
		return "redirect:/order/select";
	}

}
