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
    OrderDao dao = new OrderDao();
    List<MenuItemDto> menuList = dao.getMenuItems();

    // 중복 없이 상위 카테고리(Parent), 하위 카테고리(Child) 리스트 생성
    List<String> parentList = new ArrayList<>();
    List<String> childList = new ArrayList<>();

    for (MenuItemDto item : menuList) {
      if (!parentList.contains(item.getParentName())) {
        parentList.add(item.getParentName());
      }
    }

    // 선택된 상위 카테고리 (파라미터로 받거나 첫 번째 기본값)
    String selectedBig = request.getParameter("parent");
    if (selectedBig == null || selectedBig.isEmpty()) {
      selectedBig = parentList.isEmpty() ? "" : parentList.get(0);
    }

    // 선택된 상위 카테고리에 해당하는 하위 카테고리만 추출
    for (MenuItemDto item : menuList) {
      if (item.getParentName().equals(selectedBig) && !childList.contains(item.getCategoryName())) {
        childList.add(item.getCategoryName());
      }
    }

    // 선택된 하위 카테고리 (파라미터로 받거나 첫 번째 기본값)
    String selectedSmall = request.getParameter("child");
    if (selectedSmall == null || selectedSmall.isEmpty()) {
      selectedSmall = childList.isEmpty() ? "" : childList.get(0);
    }

    // 선택된 상/하위 카테고리에 해당하는 메뉴만 필터링
    List<MenuItemDto> filteredMenuList = new ArrayList<>();
    for (MenuItemDto item : menuList) {
      if (item.getParentName().equals(selectedBig)
          && item.getCategoryName().equals(selectedSmall)) {
        filteredMenuList.add(item);
      }
    }

    // JSP에 넘길 속성 설정
    request.setAttribute("bigCategories", parentList);
    request.setAttribute("smallCategories", childList);
    request.setAttribute("menuList", filteredMenuList);
    request.setAttribute("selectedBig", selectedBig);
    request.setAttribute("selectedSmall", selectedSmall);

    return "order/new_menu.jsp";
  }
}
