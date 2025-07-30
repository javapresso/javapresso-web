package com.javapresso.handler.menu;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javapresso.dao.MenuDao;
import com.javapresso.dto.MenuItemDto;
import com.javapresso.handler.CommandHandler;

public class MenuDetailGetHandler implements CommandHandler {
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		String menuName = request.getParameter("menuId");
		MenuDao menuDao = new MenuDao();
		
		MenuItemDto menuItem = menuDao.getMenu(menuName);
		
		request.setAttribute("targetMenu", menuItem);
		return "menu/detail.jsp";
	}
}
