package com.javapresso.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import org.apache.tomcat.jdbc.pool.DataSource;
import com.javapresso.dto.MenuItemDto;
import com.javapresso.dto.OrderDto;
import com.javapresso.dto.PointItemDto;


public class OrderDao {
  static DataSource dataSource = null;

  static {
    try {
      Context context = new InitialContext();
      dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle");
    } catch (NamingException e) {
      e.printStackTrace();
    }
  }

  public ArrayList<MenuItemDto> getMenuItems() {
    try (Connection con = dataSource.getConnection()) {
      String sql = "SELECT c.parent_name AS parentName, "
          + "       m.category_name AS categoryName, " + "       m.menu_name AS menuName, "
          + "       m.price AS price, " + "       m.description AS description, "
          + "       m.is_soldout AS isSoldout, " + "       m.iceable AS iceable " + "FROM menus m "
          + "JOIN categories c ON m.category_name = c.category_name "
          + "ORDER BY parent_name DESC, m.category_name";
      PreparedStatement stmt = con.prepareStatement(sql);
      ResultSet rs = stmt.executeQuery();

      ArrayList<MenuItemDto> menuList = new ArrayList<>();
      while (rs.next()) {
        MenuItemDto item = new MenuItemDto();
        item.setParentName(rs.getString("parentName"));
        item.setCategoryName(rs.getString("categoryName"));
        item.setMenuName(rs.getString("menuName"));
        item.setPrice(rs.getInt("price"));
        item.setDescription(rs.getString("description"));
        item.setIsSoldout(rs.getInt("isSoldout"));
        item.setIceable(rs.getInt("iceable"));

        menuList.add(item);
      }

      return menuList;
    } catch (SQLException e) {
      System.out.println("메뉴 조회 중 오류 발생");
      e.printStackTrace();
      return null;
    }
  }

  // 02. 주문하기
  public boolean insertOrder(String customerId, String menuName, String request, boolean isIce,
      boolean useCoupon) {
    try (Connection con = dataSource.getConnection()) {
      // 1. 주문 insert
      String orderSql =
          "INSERT INTO orders (order_id, order_date, customer_id, menu_name, request, is_ice, use_coupon) "
              + "VALUES (order_seq.nextval, SYSDATE, ?, ?, ?, ?, ?)";
      PreparedStatement stmt = con.prepareStatement(orderSql);
      stmt.setString(1, customerId);
      stmt.setString(2, menuName);
      stmt.setString(3, request);
      stmt.setInt(4, isIce ? 1 : 0);
      stmt.setInt(5, useCoupon ? 1 : 0);
      stmt.executeUpdate();

      // 2. 쿠폰 사용 시 차감
      if (useCoupon && !customerId.equals("비회원")) {
        String updateCouponSql = "UPDATE members SET coupon = coupon - 1 WHERE customer_id = ?";
        PreparedStatement updateCouponStmt = con.prepareStatement(updateCouponSql);
        updateCouponStmt.setString(1, customerId);
        updateCouponStmt.executeUpdate();
      }

      // 3. 스탬프 1 증가 (비회원 제외)
      if (!customerId.equals("비회원")) {
        String updateStampSql = "UPDATE members SET stamp = stamp + 1 WHERE customer_id = ?";
        PreparedStatement updateStampStmt = con.prepareStatement(updateStampSql);
        updateStampStmt.setString(1, customerId);
        updateStampStmt.executeUpdate();

        // 4. 스탬프가 10 이상이면 -> 스탬프 -10, 쿠폰 +1
        String checkSql = "SELECT stamp FROM members WHERE customer_id = ?";
        PreparedStatement checkStmt = con.prepareStatement(checkSql);
        checkStmt.setString(1, customerId);
        ResultSet rs = checkStmt.executeQuery();

        if (rs.next()) {
          int stamp = rs.getInt("stamp");
          if (stamp >= 10) {
            String rewardSql =
                "UPDATE members SET stamp = stamp - 10, coupon = coupon + 1 WHERE customer_id = ?";
            PreparedStatement rewardStmt = con.prepareStatement(rewardSql);
            rewardStmt.setString(1, customerId);
            rewardStmt.executeUpdate();
            System.out.println("스탬프 10개 달성! 쿠폰 1장이 발급되었습니다.");
          }
        }
      }
      return true;
    } catch (SQLException e) {
      e.printStackTrace();
      return false;
    }
  }

  // 기존 회원인가 확인
  public boolean isMemberExists(String customerId) throws SQLException {
    String sql = "SELECT 1 FROM members WHERE customer_id = ?";
    try (Connection con = dataSource.getConnection()) {
      PreparedStatement ps = con.prepareStatement(sql);
      ps.setString(1, customerId);
      ResultSet rs = ps.executeQuery();
      return rs.next();
    } catch (SQLException e) {
      e.printStackTrace();
    }
    return false;
  }

  public boolean insertMember(String customerId) throws SQLException {
    String sql = "INSERT INTO members (customer_id, stamp, coupon) VALUES (?, 0, 0)";
    try (Connection con = dataSource.getConnection()) {
      PreparedStatement ps = con.prepareStatement(sql);
      ps.setString(1, customerId);
      return ps.executeUpdate() > 0;
    } catch (SQLException e) {
      e.printStackTrace();
    }
    return false;
  }

  public ResultSet getUserCoupon(String customerId) throws SQLException {
    try (Connection con = dataSource.getConnection()) {
      String sql = "SELECT coupon FROM members WHERE customer_id = ?";
      PreparedStatement ps = con.prepareStatement(sql);
      ps.setString(1, customerId);
      return ps.executeQuery();
    } catch (SQLException e) {
      e.printStackTrace();
    }
    return null;
  }

  public ResultSet getAvailableMenus(String smallCategoryName) throws SQLException {
    try (Connection con = dataSource.getConnection()) {
      String sql = "SELECT menu_name, price FROM menus WHERE category_name = ? AND is_soldout = 0";
      PreparedStatement stmt = con.prepareStatement(sql);
      stmt.setString(1, smallCategoryName);
      return stmt.executeQuery();
    } catch (SQLException e) {
      e.printStackTrace();
    }
    return null;
  }

  // 3. 주문내역 확인하기
  public List<OrderDto> getOrderList() {
    List<OrderDto> list = new ArrayList<>();

    try (Connection con = dataSource.getConnection()) {
      String sql = "SELECT order_id AS orderId, " + "customer_id AS customerId, "
          + "menu_name AS menuName, " + "order_date AS orderDate " + "FROM orders "
          + "WHERE TRUNC(order_date) = TRUNC(SYSDATE) " + "ORDER BY order_date DESC";
      PreparedStatement stmt = con.prepareStatement(sql);
      ResultSet rs = stmt.executeQuery();

      while (rs.next()) {
        OrderDto order = new OrderDto();
        order.setOrderId(rs.getInt("orderId"));
        order.setCustomerId(rs.getString("customerId"));
        order.setMenuName(rs.getString("menuName"));
        order.setOrderDate(rs.getDate("orderDate"));

        list.add(order);
      }

    } catch (SQLException e) {
      e.printStackTrace();
    }

    return list;
  }


  // 4. 주문 취소하기
  public ResultSet getRecentOrders() throws SQLException {
    try (Connection con = dataSource.getConnection()) {
      String sql = "SELECT order_id, customer_id, menu_name, order_date " + "FROM orders "
          + "WHERE order_date BETWEEN (SYSDATE- 1/24) AND SYSDATE " + "ORDER BY order_date DESC ";
      PreparedStatement stmt = con.prepareStatement(sql);
      return stmt.executeQuery();
    } catch (SQLException e) {
      e.printStackTrace();
    }
    return null;
  }

  // 특정 주문 상세 조회
  public ResultSet getOrderById(int orderId) throws SQLException {
    try (Connection con = dataSource.getConnection()) {
      String sql =
          "SELECT order_id, order_date, customer_id, menu_name, request, is_ice, use_coupon "
              + "FROM orders WHERE order_id = ?";
      PreparedStatement stmt = con.prepareStatement(sql);
      stmt.setInt(1, orderId);
      return stmt.executeQuery();
    } catch (SQLException e) {
      e.printStackTrace();
    }
    return null;
  }

  // 주문 취소
  public int deleteOrderById(int orderId) {
    try (Connection con = dataSource.getConnection()) {
      String sql = "DELETE FROM orders WHERE order_id = ?";
      PreparedStatement stmt = con.prepareStatement(sql);
      stmt.setInt(1, orderId);
      return stmt.executeUpdate();
    } catch (SQLException e) {
      e.printStackTrace();
    }
    return 0;

  }

  // 5. 포인트 확인
  public PointItemDto getMemberPointInfo(String customerId) {
    try (Connection con = dataSource.getConnection()) {
      String sql = "SELECT customer_id, stamp, coupon, FLOOR(stamp / 10) AS expectedCoupon "
          + "FROM members WHERE customer_id = ?";
      PreparedStatement stmt = con.prepareStatement(sql);
      stmt.setString(1, customerId);

      ResultSet rs = stmt.executeQuery();

      if (rs.next()) {
        PointItemDto point = new PointItemDto();
        point.customerId = rs.getString("customer_id");
        point.stamp = rs.getInt("stamp");
        point.coupon = rs.getInt("coupon");
        point.expectedCoupon = rs.getInt("expectedCoupon");
        return point;
      }
    } catch (SQLException e) {
      e.printStackTrace();
    }
    return null;
  }
}
