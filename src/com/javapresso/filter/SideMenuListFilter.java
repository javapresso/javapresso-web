package com.javapresso.filter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.ResourceBundle;
import javax.servlet.http.HttpSession;
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
		HttpSession session = req.getSession();

		// 세션에서 언어 설정, 없으면 기본
		Locale locale = (Locale) session.getAttribute("selectedLocale");
		if (locale == null) {
			locale = Locale.KOREAN;
		}
		
		ResourceBundle bundle = ResourceBundle.getBundle("messages", locale);

		List<SideMenuItem> menuList = new ArrayList<>();
		
		if (uri.startsWith("/order")) {
			menuList.add(new SideMenuItem(bundle.getString("sidebar.orderMenu"), "/order/menuform"));
			menuList.add(new SideMenuItem(bundle.getString("sidebar.orderInsert"), "/order/insert/menu"));
			menuList.add(new SideMenuItem(bundle.getString("sidebar.orderSelect"), "/order/selectform"));
			menuList.add(new SideMenuItem(bundle.getString("sidebar.orderDelete"), "/order/deleteform"));
			menuList.add(new SideMenuItem(bundle.getString("sidebar.orderCoupon"), "/order/couponform"));
		} else if (uri.startsWith("/menu")) {
			menuList.add(new SideMenuItem(bundle.getString("sidebar.menuSelect"), "/menu"));
			menuList.add(new SideMenuItem(bundle.getString("sidebar.menuInsert"), "/menu/insertform"));
			menuList.add(new SideMenuItem(bundle.getString("sidebar.menuUpdate"), "/menu/updateform"));
			menuList.add(new SideMenuItem(bundle.getString("sidebar.menuDelete"), "/menu/deleteform"));
		} else if (uri.startsWith("/employee")) {
			menuList.add(new SideMenuItem(bundle.getString("sidebar.employeeSelect"), "/employee/select"));
			menuList.add(new SideMenuItem(bundle.getString("sidebar.employeeInsert"), "/employee/insert"));
			menuList.add(new SideMenuItem(bundle.getString("sidebar.employeeUpdate"), "/employee/update"));
			menuList.add(new SideMenuItem(bundle.getString("sidebar.employeeDelete"), "/employee/delete"));
		} else {
			// 기본메뉴
		}

		request.setAttribute("sideMenus", menuList);

		chain.doFilter(request, response);
	}
}
