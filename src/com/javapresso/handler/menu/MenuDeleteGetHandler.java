package com.javapresso.handler.menu;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javapresso.handler.CommandHandler;

public class MenuDeleteGetHandler implements CommandHandler {
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		return "menu/delete.jsp";
	}
}
