package com.javapresso.handler;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javapresso.dao.MenuDao;
import com.javapresso.dao.SideMenuItem;

public class MenuInsertGetHandler implements CommandHandler {
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		MenuDao menuDao = new MenuDao();
		ArrayList<String> categories = menuDao.getParentCategories();
		ArrayList<SideMenuItem> menuList = new ArrayList<>();
		
		menuList.add(new SideMenuItem("메뉴 조회하기", "/menu/selectform"));
		menuList.add(new SideMenuItem("메뉴 추가하기", "/menu/insertform"));
		menuList.add(new SideMenuItem("메뉴 수정하기", "/menu/updateform"));
		menuList.add(new SideMenuItem("메뉴 삭제하기", "/menu/deleteform"));
		
		request.setAttribute("parentMenus", categories);
		request.setAttribute("menuList", menuList);
		
		System.out.println("categories " + categories);
	    for(String category : categories) {
	        System.out.println("category: " + category + " (class: " + category.getClass().getName() + ")");
	    }
		return "menu/insert.jsp";
	}
}
