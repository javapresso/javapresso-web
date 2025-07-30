package com.javapresso.handler.menu;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javapresso.dao.MenuDao;
import com.javapresso.handler.CommandHandler;

public class MenuDeletePostHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		MenuDao menuDao = new MenuDao();
		String menuName = request.getParameter("menu_id");
	
		try {
			menuDao.deleteMenu(menuName);
		} catch (Exception e) {
			request.setAttribute("error", e.getMessage());
			
			return "error/runtime.jsp";
		}
		
		return "redirect:/menu";
	}

}
