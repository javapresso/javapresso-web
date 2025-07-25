package com.javapresso.handler;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javapresso.dao.SideMenuItem;

public class MenuHomeGetHandler implements CommandHandler{
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		ArrayList<SideMenuItem> menuList = new ArrayList<>();
		
		menuList.add(new SideMenuItem("메뉴 조회하기", "/menu/selectform"));
		menuList.add(new SideMenuItem("메뉴 추가하기", "/menu/insertform"));
		menuList.add(new SideMenuItem("메뉴 수정하기", "/menu/updateform"));
		menuList.add(new SideMenuItem("메뉴 삭제하기", "/menu/deleteform"));

		request.setAttribute("menuList", menuList);
		
		return "menu/index.jsp";
	}
}
