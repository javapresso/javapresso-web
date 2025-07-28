package com.javapresso.handler.order;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.javapresso.dao.OrderDao;
import com.javapresso.dto.MenuItemDto;
import com.javapresso.handler.CommandHandler;

public class OrderInsertMenuHandler implements CommandHandler {

  @Override
  public String process(HttpServletRequest request, HttpServletResponse response) {
    // 주문하기 - 메뉴/옵션 선택 페이지
    OrderDao dao = new OrderDao();
    ArrayList<MenuItemDto> menuList = dao.getMenuItems();
    // request.setAttribute("menuList", menuList);

    // parentName과 categoryName 리스트 추출해야함.. 테이블이 다르니까
    List<String> parentList = new ArrayList<>();
    List<String> categoryList = new ArrayList<>();

    for (MenuItemDto item : menuList) {
      if (!parentList.contains(item.getParentName())) {
        parentList.add(item.getParentName());
      }
      if (!categoryList.contains(item.getCategoryName())) {
        categoryList.add(item.getCategoryName());
      }
    }

    // JSP로 넘길 데이터 - 카테고리도 따로 받아와야하는데 안받아옴..
    request.setAttribute("menuList", menuList); // 메뉴 전체
    request.setAttribute("parentName", parentList); // 상위 카테고리
    request.setAttribute("categoryName", categoryList); // 하위 카테고리


    return "order/new_menu.jsp";
  }

}
