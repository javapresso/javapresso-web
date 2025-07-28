package com.javapresso.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class OrderInsertCouponHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// 주문하기 - 멤버쉽 입/출력 페이지
		
		String member_id = request.getParameter("phone");
		String menuName = request.getParameter("name");
		String req = request.getParameter("request");
		String is_ice = request.getParameter("ice");
		
		return "order/new_coupon.jsp";
	}

}
