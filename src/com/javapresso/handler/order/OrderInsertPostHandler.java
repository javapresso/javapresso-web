package com.javapresso.handler.order;

import java.sql.ResultSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javapresso.dao.OrderDao;
import com.javapresso.dto.PointItemDto;
import com.javapresso.handler.CommandHandler;

public class OrderInsertPostHandler implements CommandHandler {
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		String customerId = request.getParameter("phone");
		String menuName = request.getParameter("menuName");
		String requestText = request.getParameter("request");
		boolean isIce = "1".equals(request.getParameter("ice"));

		String couponRawParam = request.getParameter("coupon");
		boolean couponParamExists = couponRawParam != null;
		boolean useCouponParam = "1".equals(couponRawParam);

		OrderDao dao = new OrderDao();

		boolean isMember = false;
		int couponCount = 0;
		PointItemDto point = dao.getMemberPointInfo(customerId);
		try {
			isMember = dao.isMemberExists(customerId);
			if (isMember) {
				ResultSet rs = dao.getUserCoupon(customerId);
				if (rs != null && rs.next()) {
					couponCount = rs.getInt("coupon");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "DB 조회 중 오류 발생");
			return "error/error404.jsp";
		}

		request.setAttribute("customerId", customerId);
		request.setAttribute("menuName", menuName);
		request.setAttribute("requestText", requestText);
		request.setAttribute("point", point);
		request.setAttribute("isIce", isIce);
		request.setAttribute("couponCount", couponCount);

		if (isMember && couponCount > 0 && !couponParamExists) {
			return "order/couponform.jsp";
		}

		boolean useCoupon = useCouponParam && couponCount > 0;
		boolean success = dao.insertOrder(customerId, menuName, requestText, isIce, useCoupon);

		if (success) {
			return "redirect:/order/insert/result?id=" + customerId;
		} else {
			request.setAttribute("error", "주문 처리 실패");
			return "redirect:/error/error404.jsp";
		}
	}
}