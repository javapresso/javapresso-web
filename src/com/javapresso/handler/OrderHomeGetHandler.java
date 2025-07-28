package com.javapresso.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class OrderHomeGetHandler implements CommandHandler {

  @Override
  public String process(HttpServletRequest request, HttpServletResponse response) {
    return "order/menuboard.jsp";
  }

}
