package com.javapresso.handler.order;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.javapresso.dao.OrderDao;
import com.javapresso.dto.MenuItemDto;
import com.javapresso.handler.CommandHandler;

public class OrderInsertGetHandler implements CommandHandler {

  @Override
  public String process(HttpServletRequest request, HttpServletResponse response) {

    System.out.println("=====test 디버깅 orderinsertgethandler =====");
    String menuName = request.getParameter("menuName");
    if (menuName == null || menuName.isEmpty()) {
      request.setAttribute("error", "메뉴 이름이 전달되지 않았습니다.");
      return "/WEB-INF/views/error.jsp";
    }

    OrderDao dao = new OrderDao();
    List<MenuItemDto> menuList = dao.getMenuItems(); // 전체 메뉴를 가져옴

    MenuItemDto menu = null;
    for (MenuItemDto m : menuList) {
      if (menuName.equals(m.getMenuName())) {
        menu = m;
        break;
      }
    }

    if (menu == null) {
      request.setAttribute("error", "해당 메뉴를 찾을 수 없습니다.");
      return "/WEB-INF/views/error.jsp";
    }

    request.setAttribute("menu", menu);
    return "order/insert_form.jsp";

  }
}
