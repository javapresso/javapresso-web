package com.javapresso.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class OrderInsertResultHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// 주문하기 - 결과 확인 페이지
		
		String member_id = request.getParameter("phone");
		String menuName = request.getParameter("name");
		String req = request.getParameter("request");
		String is_ice = request.getParameter("ice");
		String coupon = request.getParameter("coupon");
		
		return "order/result.jsp";
	}

}
