package com.javapresso.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

import org.apache.tomcat.jdbc.pool.DataSource;

import com.javapresso.dto.MenuDto;
import com.javapresso.dto.MenuItemDto;

public class MenuDao {
	static DataSource dataSource = null;
	
	static {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource)context.lookup("java:comp/env/jdbc/Oracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	public void updateMenuAll(String menuId, MenuDto menuDto) {
		System.out.println("menuId 수정: " + menuId);
		System.out.println("바꿀내용: " + menuDto);
	    Connection con = null;
	    PreparedStatement stmt = null;
	    System.out.println("수정하면 여기타야돼요");
	    try {
	        con = dataSource.getConnection();
	        con.setAutoCommit(false);
	        
	        String sql = "UPDATE menus SET menu_name = ?, price = ?, description = ?, " +
	                     "iceable = ?, thumbnail_path = ? " +
	                     "WHERE menu_name = ?";
	        
	        stmt = con.prepareStatement(sql);
	        stmt.setString(1, menuDto.getMenuName());
	        stmt.setInt(2, menuDto.getPrice());
	        stmt.setString(3, menuDto.getDescription());
	        stmt.setInt(4, menuDto.isIceable() ? 1 : 0);
	        stmt.setString(5, menuDto.getThumbnailPath());
	        stmt.setString(6, menuId);
	        
	        int updateRow = stmt.executeUpdate();
	        if (updateRow == 0) {
	            throw new RuntimeException("해당 메뉴를 찾을 수 없습니다. menu_id: " + menuDto.getMenuName());
	        }
	        
	        con.commit();
	        
	    } catch (SQLException e) {
	        e.printStackTrace();
	        try {
	            if (con != null) con.rollback();
	        } catch (SQLException e2) {
	            e2.printStackTrace();
	        }
	        throw new RuntimeException("메뉴 업데이트 중 오류가 발생했습니다.", e);
	        
	    } finally {
	        try {
	            if (con != null) con.setAutoCommit(true);
	        } catch (SQLException e3) {
	            e3.printStackTrace();
	        }
	        
	        if (stmt != null) try { stmt.close(); } catch (SQLException e) {}
	        if (con != null) try { con.close(); } catch (SQLException e) {}
	    }
	}

	
	public MenuItemDto getMenu(String menuName) {
		try (Connection con = dataSource.getConnection()) {
			String sql = "SELECT c.parent_name AS parentName, "
			           + "m.category_name AS categoryName, m.menu_name AS menuName, m.price AS price, "
			           + "m.description AS description, m.is_soldout AS is_soldout, m.iceable AS iceable, m.thumbnail_path AS thumbnailPath "
			           + "FROM menus m "
			           + "JOIN categories c ON m.category_name = c.category_name "
			           + "WHERE m.menu_name = ? "
			           + "ORDER BY c.parent_name DESC, m.category_name";
			
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, menuName);
			
			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
				MenuItemDto menuItemDto = new MenuItemDto();
				
				menuItemDto.setParentName(rs.getString("parentName"));
				menuItemDto.setCategoryName(rs.getString("categoryName"));
				menuItemDto.setMenuName(rs.getString("menuName"));
				menuItemDto.setDescription(rs.getString("description"));
				menuItemDto.setPrice(rs.getInt("price"));
				menuItemDto.setIsSoldout(rs.getInt("is_soldout"));
				menuItemDto.setIceable(rs.getInt("iceable"));
				menuItemDto.setThumbnailPath(rs.getString("thumbnailPath"));

				return menuItemDto;
			} else { return null; }
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			return null;
		}
	}
	
	
	public void insertMenu (String subCategory, String menuName, int price, String description, int iceable, String filePath) {
		Connection con = null;

		System.out.println("subCategory" + subCategory);
		System.out.println("menuName" + menuName);
		System.out.println("description" + description);
		
		try {
			con = dataSource.getConnection();
			con.setAutoCommit(false);

			String sql = "INSERT INTO menus ("
					+ "category_name, menu_name, price, description, iceable, is_soldout, thumbnail_path"
					+ ") VALUES (?, ?, ?, ?, ?, 0, ?)";

			PreparedStatement stmt = con.prepareStatement(sql);

			stmt.setString(1, subCategory);
			stmt.setString(2, menuName);
			stmt.setInt(3, price);
			stmt.setString(4, description);
			stmt.setInt(5, iceable);
			stmt.setString(6, filePath);

			int insertMenuCount = stmt.executeUpdate();

			if (insertMenuCount == 0) {
				throw new RuntimeException();
			}

			con.commit();
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		} finally {
			try {con.setAutoCommit(true);} catch (Exception e1) {}
			if (con != null) try { con.close(); } catch (Exception e) {}
		}
	}

	public List<String> getMenuHeader() {

		List<String> columns = new ArrayList<>();

		try (Connection con = dataSource.getConnection()) {

			String sql = "SELECT "
					+ "category_name, menu_name, price, is_soldout, iceable, description "
					+ "FROM menus WHERE 1=0";

			PreparedStatement stmt = con.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();

			ResultSetMetaData rsmd = rs.getMetaData();
			int columnCount = rsmd.getColumnCount();

			for (int i = 1; i <= columnCount; i++) {
				columns.add(rsmd.getColumnName(i));
			}

			return columns;
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException();

		}
	}

	public ArrayList<String> getParentCategories () {
		ArrayList<String> categories = new ArrayList<>();
    
		try (Connection con = dataSource.getConnection()) {
			String sql = "SELECT category_name "
					+   "FROM categories "
					+ "WHERE parent_name IS NULL";

			PreparedStatement stmt = con.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();

			while(rs.next()) categories.add(rs.getString("category_name"));

			return categories;
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}

	public ArrayList<String> getChildCategories (String parent) {
		ArrayList<String> subCategories = new ArrayList<>();

		try (Connection con = dataSource.getConnection()) {

      String sql = "SELECT category_name FROM"
          +  "(SELECT category_name, parent_name, LEVEL "
          +    "FROM categories "
          +    "START WITH parent_name IS NULL "
          +    "CONNECT BY PRIOR category_name = parent_name) "
            + "WHERE parent_name = ?";

			PreparedStatement stmt = con.prepareStatement(sql);

			stmt.setString(1, parent);
			ResultSet rs = stmt.executeQuery();

			while(rs.next()) subCategories.add(rs.getString("category_name"));

			return subCategories;
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}

	public ArrayList<String> getMenuNames() {
		ArrayList<String> menuList = new ArrayList<>();

		try (Connection con = dataSource.getConnection()) {

			String sql = "SELECT menu_name FROM menus";

			PreparedStatement stmt = con.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();

			while(rs.next()) {
				String menuName = rs.getString("menu_name");
				menuList.add(menuName);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return menuList;

	}

	public void deleteMenu (String tartgetMenu) {
		Connection con = null;

		try {
			con = dataSource.getConnection();
			con.setAutoCommit(false);

			String sql = "DELETE FROM menus WHERE menu_name = ?";

			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, tartgetMenu);

			int deleteRow = stmt.executeUpdate();

			if (deleteRow == 0) {
				throw new RuntimeException();
			}

			con.commit();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			try {con.rollback();} catch (Exception e2) {}
			throw new RuntimeException();
		} finally {
			try {con.setAutoCommit(true);} catch (Exception e3) {}
			if (con != null) try { con.close(); } catch (Exception e) {}
		}
	}

	public void updateMenu (String columnName, int updateNumber, String targetMenu) {
		Connection con = null;

		try {
			con = dataSource.getConnection();
			con.setAutoCommit(false);

			String sql = "UPDATE menus SET "+ columnName + " = ? WHERE menu_name = ?";

			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setInt(1, updateNumber);
			stmt.setString(2, targetMenu);

			int updateRow = stmt.executeUpdate();
			if (updateRow == 0) {
				throw new RuntimeException();
			}
			con.commit();
		} catch (SQLException e) {
			e.printStackTrace();
			try {con.rollback();} catch (Exception e2) {}
			throw new RuntimeException();
		} finally {
			try {con.setAutoCommit(true);} catch (Exception e3) {}
			if (con != null) try { con.close(); } catch (Exception e) {}
		}
	}

	public void updateMenu (String columnName, String  updateString, String targetMenu) {
		Connection con = null;

		try {
			con = dataSource.getConnection();
			con.setAutoCommit(false);

			String sql = "UPDATE menus SET "+ columnName + " = ? WHERE menu_name = ?";

			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, updateString);
			stmt.setString(2, targetMenu);

			int updateRow = stmt.executeUpdate();
			if (updateRow == 0) {
				throw new RuntimeException();
			}
			con.commit();
		} catch (SQLException e) {
			e.printStackTrace();
			try {con.rollback();} catch (Exception e2) {}
			throw new RuntimeException();
		} finally {
			try {con.setAutoCommit(true);} catch (Exception e3) {}
			if (con != null) try { con.close(); } catch (Exception e) {}
		}
	}


	public String getThumbnailPath(String menuName) throws SQLException {
		String thumnail_path = null;
		try (Connection con = dataSource.getConnection()) {

			String sql = "SELECT thumnail_path "
					+ "FROM menus "
					+ "WHERE menu_name = ?";

			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, menuName);

			ResultSet rs = stmt.executeQuery();

			if (rs.next()) thumnail_path = rs.getString("THUMBNAIL_PATH");
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return thumnail_path;
	}
}

