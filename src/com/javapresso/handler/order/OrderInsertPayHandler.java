package com.javapresso.handler.order;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.javapresso.handler.CommandHandler;

public class OrderInsertPayHandler implements CommandHandler {

  @Override
  public String process(HttpServletRequest request, HttpServletResponse response) {
    // 주문하기 - 결제 선택 페이지
    return "order/insert_result.jsp";
  }

}
