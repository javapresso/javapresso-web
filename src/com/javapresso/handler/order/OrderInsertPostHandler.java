package com.javapresso.handler.order;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javapresso.dao.OrderDao;
import com.javapresso.dto.MenuItemDto;
import com.javapresso.handler.CommandHandler;

public class OrderInsertPostHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// 주문하기 - 메뉴/옵션 선택 페이지
		OrderDao dao = new OrderDao();
		
		String member_id = request.getParameter("phone");
		String menuName = request.getParameter("name");
		String req = request.getParameter("request");
		String is_ice = request.getParameter("ice");
		String coupon = request.getParameter("coupon");
		dao.insertOrder(member_id, menuName, req, is_ice == "1" ? true : false, coupon == "1" ? true : false);
		
		return "redirect:order/result";
	}

}
