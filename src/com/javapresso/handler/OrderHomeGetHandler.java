package com.javapresso.handler;

import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.javapresso.dao.SideMenuItem;

public class OrderHomeGetHandler implements CommandHandler {
  ArrayList<SideMenuItem> orderList = new ArrayList<>();

  @Override
  public String process(HttpServletRequest request, HttpServletResponse response) {
    orderList.add(new SideMenuItem("메뉴판", "/order/menuboard"));
    orderList.add(new SideMenuItem("주문하기", "/order/insertform"));
    orderList.add(new SideMenuItem("포인트확인", "/order/membership"));
    // orderList.add(new SideMenuItem("관리자모드", "")); //관리자 모드 클릭하면 관리자 로그인 화면으로 이동
    // orderList.add(new SideMenuItem("주문내역확인", "/order/membership"));
    // orderList.add(new SideMenuItem("주문취소", "/order/membership"));
    request.setAttribute("menuList", orderList);
    return "order/menuboard.jsp";
  }

}
