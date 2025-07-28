package com.javapresso.handler.menu;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javapresso.handler.CommandHandler;

public class MenuSelectGetHandler implements CommandHandler {
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		return "menu/detail.jsp";
	}
}
