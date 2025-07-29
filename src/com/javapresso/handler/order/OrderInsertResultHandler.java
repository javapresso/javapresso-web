/*
 * package com.javapresso.handler.order;
 * 
 * import javax.servlet.http.HttpServletRequest; import javax.servlet.http.HttpServletResponse;
 * import com.javapresso.handler.CommandHandler;
 * 
 * public class OrderInsertResultHandler implements CommandHandler {
 * 
 * @Override public String process(HttpServletRequest request, HttpServletResponse response) { //
 * 주문하기 - 결과 확인 페이지
 * 
 * String member_id = request.getParameter("phone"); String menuName = request.getParameter("name");
 * String req = request.getParameter("request"); String is_ice = request.getParameter("ice"); String
 * coupon = request.getParameter("coupon");
 * 
 * return "order/result.jsp"; } }
 */package com.javapresso.handler.order;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javapresso.dao.OrderDao;
import com.javapresso.dto.PointItemDto;
import com.javapresso.handler.CommandHandler;

public class OrderInsertResultHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		OrderDao dao = new OrderDao();

		String customerId = request.getParameter("id");
		PointItemDto point = dao.getMemberPointInfo(customerId);
		request.setAttribute("point", point);
		return "/order/insert_result.jsp";
	}
}
