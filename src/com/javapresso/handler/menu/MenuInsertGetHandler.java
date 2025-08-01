package com.javapresso.handler.menu;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javapresso.dao.MenuDao;

import com.javapresso.handler.CommandHandler;

public class MenuInsertGetHandler implements CommandHandler {
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		MenuDao menuDao = new MenuDao();
		ArrayList<String> categories = menuDao.getParentCategories();

		request.setAttribute("parentMenus", categories);
		
		System.out.println("categories " + categories);
	    for(String category : categories) {
	        System.out.println("category: " + category + " (class: " + category.getClass().getName() + ")");
	    }
		return "menu/insert.jsp";
	}
}
