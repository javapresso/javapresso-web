package com.javapresso.handler.order;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.javapresso.handler.CommandHandler;

public class OrderCouponHandler implements CommandHandler {
  @Override
  public String process(HttpServletRequest request, HttpServletResponse response) {

    // 쿠폰 확인 기능 - 쿠폰 확인 페이지

    return "order/coupon.jsp";
  }
}
