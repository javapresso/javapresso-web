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
		boolean useCouponParam = "1".equals(request.getParameter("coupon"));

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

		// 쿠폰이 있고, 쿠폰 사용 여부 결정 안 했으면 쿠폰 사용 여부 묻는 페이지로 이동 -> 쿠폰 사용여부 처음부터 안물어보고 쿠폰이 있는
		// 경우만 물어보는 페이지 나오게
		if (isMember && couponCount > 0 && !useCouponParam) {
			return "order/couponform.jsp";
		}

		// 쿠폰 사용 여부가 결정됐거나 쿠폰 없음 -> 주문 처리
		boolean useCoupon = useCouponParam && couponCount > 0;
		boolean success = dao.insertOrder(customerId, menuName, requestText, isIce, useCoupon);

		if (success) {
//			return "order/insert_result.jsp";
			return "redirect:/order/insert/result?id=" + customerId;
		} else {
			request.setAttribute("error", "주문 처리 실패");
			return "redirect:/error/error404.jsp";
		}
	}
}
