package com.javapresso.handler.order;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.javapresso.dao.OrderDao;
import com.javapresso.dto.OrderDto;
import com.javapresso.handler.CommandHandler;

public class OrderDeleteHandler implements CommandHandler {

  @Override
  public String process(HttpServletRequest request, HttpServletResponse response) {
    OrderDao dao = new OrderDao();
    List<OrderDto> orderList = new ArrayList<>();

    try (ResultSet rs = dao.getRecentOrders()) {
      while (rs != null && rs.next()) {
        OrderDto dto = new OrderDto();
        dto.setOrderId(rs.getInt("order_id"));
        dto.setCustomerId(rs.getString("customer_id"));
        dto.setMenuName(rs.getString("menu_name"));
        // dto.setOrderDate(rs.getTimestamp("order_date"));

        orderList.add(dto);
      }
    } catch (Exception e) {
      e.printStackTrace();
    }

    request.setAttribute("orderList", orderList);
    return "order/delete.jsp";
  }

}
