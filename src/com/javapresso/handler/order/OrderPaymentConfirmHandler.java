package com.javapresso.handler.order;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.javapresso.handler.CommandHandler;

public class OrderPaymentConfirmHandler implements CommandHandler {
  @Override
  public String process(HttpServletRequest request, HttpServletResponse response) {
    String paymentMethod = request.getParameter("paymentMethod");

    // TODO: 결제 처리 로직 구현

    // 예: 결제 완료 페이지로 이동
    request.setAttribute("paymentMethod", paymentMethod);
    return "/WEB-INF/views/order/payment_result.jsp";
  }
}
