package com.javapresso.handler.order;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.javapresso.handler.CommandHandler;

public class OrderPaymentConfirmHandler implements CommandHandler {
  @Override
  public String process(HttpServletRequest request, HttpServletResponse response) {
    // String paymentMethod = request.getParameter("paymentMethod");
    // request.setAttribute("paymentMethod", paymentMethod);

    return "order/order_paying.jsp";
  }
}
