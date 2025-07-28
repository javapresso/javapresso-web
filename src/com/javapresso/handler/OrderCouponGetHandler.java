package com.javapresso.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javapresso.dao.OrderDao;
import com.javapresso.dto.PointItemDto;

public class OrderCouponGetHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// 쿠폰 결과 확인 페이지
		OrderDao dao = new OrderDao();
		
		String customerId = request.getParameter("id");
		PointItemDto point = dao.getMemberPointInfo(customerId);
		request.setAttribute("point", point);

		return "order/coupon_rst.jsp";
	}

}
