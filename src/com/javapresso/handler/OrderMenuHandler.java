package com.javapresso.handler;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javapresso.dao.OrderDao;
import com.javapresso.dto.MenuItemDto;

public class OrderMenuHandler implements CommandHandler {
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// 메뉴판 조회 페이지
		OrderDao dao = new OrderDao();
		ArrayList<MenuItemDto> menuList = dao.getMenuItems();
		request.setAttribute("menuList", menuList);
		
		return "order/menu.jsp";
	}
}
