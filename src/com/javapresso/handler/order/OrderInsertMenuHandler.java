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

    List<String> parentList = new ArrayList<>();
    List<String> childList = new ArrayList<>();

    for (MenuItemDto item : menuList) {
      if (!parentList.contains(item.getParentName())) {
        parentList.add(item.getParentName());
      }
    }

    String selectedBig = request.getParameter("parent");
    if (selectedBig == null || selectedBig.isEmpty()) {
      selectedBig = parentList.isEmpty() ? "" : parentList.get(0);
    }

    for (MenuItemDto item : menuList) {
      if (item.getParentName().equals(selectedBig) && !childList.contains(item.getCategoryName())) {
        childList.add(item.getCategoryName());
      }
    }

    String selectedSmall = request.getParameter("child");
    if (selectedSmall == null || selectedSmall.isEmpty()) {
      selectedSmall = childList.isEmpty() ? "" : childList.get(0);
    }

    List<MenuItemDto> filteredMenuList = new ArrayList<>();
    for (MenuItemDto item : menuList) {
      if (item.getParentName().equals(selectedBig)
          && item.getCategoryName().equals(selectedSmall)) {
        filteredMenuList.add(item);
      }
    }

    request.setAttribute("bigCategories", parentList);
    request.setAttribute("smallCategories", childList);
    request.setAttribute("menuList", filteredMenuList);
    request.setAttribute("selectedBig", selectedBig);
    request.setAttribute("selectedSmall", selectedSmall);

    return "order/new_menu.jsp";
  }
}
