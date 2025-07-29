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

	public void insertMenu (String subCategory, String menuName, int price, String description, int iceable, String filePath) {
		Connection con = null;

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

