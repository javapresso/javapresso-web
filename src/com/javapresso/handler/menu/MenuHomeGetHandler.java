package com.javapresso.handler.menu;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javapresso.dao.OrderDao;
import com.javapresso.dto.MenuItemDto;
import com.javapresso.handler.CommandHandler;

public class MenuHomeGetHandler implements CommandHandler{
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
    OrderDao orderDao = new OrderDao();
	    
    ArrayList<MenuItemDto> menuList = orderDao.getMenuItems();
	    		
    request.setAttribute("menuList", menuList);
	    
		return "menu/index.jsp";
	}
}
