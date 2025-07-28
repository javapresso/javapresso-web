package com.javapresso.handler.order;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.javapresso.dao.OrderDao;
import com.javapresso.handler.CommandHandler;

public class OrderDeletePostHandler implements CommandHandler {

  @Override
  public String process(HttpServletRequest request, HttpServletResponse response) {
    OrderDao dao = new OrderDao();

    String id = request.getParameter("deleteOrder");
    if (id == null || id.isEmpty()) {
      request.setAttribute("error", "삭제할 주문을 선택해주세요.");
      return "order/delete.jsp";
    }

    dao.deleteOrderById(Integer.parseInt(id));

    return "redirect:/order/deleteform";

  }

}
