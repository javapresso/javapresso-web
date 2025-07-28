package com.javapresso.handler;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javapresso.dao.OrderDao;
import com.javapresso.dto.MenuItemDto;

public class OrderInsertMenuHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// 주문하기 - 메뉴/옵션 선택 페이지
		OrderDao dao = new OrderDao();
		ArrayList<MenuItemDto> menuList = dao.getMenuItems();
		request.setAttribute("menuList", menuList);

		return "order/new_menu.jsp";
	}

}
