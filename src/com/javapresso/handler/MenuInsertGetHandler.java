package com.javapresso.handler;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javapresso.dao.SideMenuItem;

public class MenuInsertGetHandler implements CommandHandler {
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		ArrayList<SideMenuItem> menuList = new ArrayList<>();
		
		menuList.add(new SideMenuItem("메뉴 조회하기", "/menu/select"));
		menuList.add(new SideMenuItem("메뉴 추가하기", "/menu/insertform"));
		
		return "menu/insert.jsp";
	}
}
