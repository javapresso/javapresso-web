package com.javapresso.filter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import com.javapresso.dao.SideMenuItem;

public class SideMenuListFilter implements Filter {
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        String uri = req.getRequestURI();

        List<SideMenuItem> menuList = new ArrayList<>();

        if (uri.startsWith("/menu")) {
            menuList.add(new SideMenuItem("메뉴 조회하기", "/menu/selectform"));
            menuList.add(new SideMenuItem("메뉴 추가하기", "/menu/insertform"));
            menuList.add(new SideMenuItem("메뉴 수정하기", "/menu/updateform"));
            menuList.add(new SideMenuItem("메뉴 삭제하기", "/menu/deleteform"));
        } else if (uri.startsWith("/order")) {
//            menuList.add(new SideMenuItem("주문 조회하기", "/order/list"));
            menuList.add(new SideMenuItem("주문 추가", "/order/add"));
        } else if (uri.startsWith("/employee")) {
//            menuList.add(new SideMenuItem("직원 조회하기", "/employee/list"));
        } else {
//            기본메뉴
        }

        request.setAttribute("menuList", menuList);

        chain.doFilter(request, response);
    }
}
