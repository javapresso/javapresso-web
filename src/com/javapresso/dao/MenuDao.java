package com.javapresso.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MenuDao {
	private final DataSource ds = new DataSource();
	 
	public List<String> getMenuHeader() {
		Connection con = null;
		
		List<String> columns = new ArrayList<>();
		
		try {
			con = ds.getConnection();
			
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
			
		} finally {
			ds.closeConnection(con);
		}
	}
	
	public List<String> getParentCategories () {
		Connection con = null;
		
		List<String> categories = new ArrayList<>();
		
		try {
			con = ds.getConnection();
			
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
		} finally {
			ds.closeConnection(con);
		}
	}
	
	public List<String> getChildCategories (String parent) {
		Connection con = null;
		
		List<String> subCategories = new ArrayList<>();
		
		try {
			con = ds.getConnection();
			
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
		} finally {
			ds.closeConnection(con);
		}
	}
	
	public ArrayList<String> getMenuNames() {
		Connection con = null;

		ArrayList<String> menuList = new ArrayList<>();
		
		try {
			con = ds.getConnection();
			
			String sql = "SELECT menu_name FROM menus";
			
			PreparedStatement stmt = con.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()) {
				String menuName = rs.getString("menu_name");
				menuList.add(menuName);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ds.closeConnection(con);
		}
		
		return menuList;
		
	}
	
	// 메뉴 등록하기
	public void insertMenu (String subCategory, String menuName, int price, String description, int iceable) {
		Connection con = null;

		
		try {
			con = ds.getConnection();
			con.setAutoCommit(false);
			
			String sql = "INSERT INTO menus ("
					+ "category_name, menu_name, price, description, iceable, is_soldout"
					+ ") VALUES (?, ?, ?, ?, ?, 0)";
			
			PreparedStatement stmt = con.prepareStatement(sql);
			
			stmt.setString(1, subCategory);
			stmt.setString(2, menuName);
			stmt.setInt(3, price);
			stmt.setString(4, description);
			stmt.setInt(5, iceable);
			
			int insertMenuCount = stmt.executeUpdate();

			if (insertMenuCount == 0) {
				throw new RuntimeException();
			}
			
			con.commit();
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		} finally {
			ds.closeConnection(con);
			try {con.setAutoCommit(true);} catch (Exception e1) {}
		}
	}
	
	public void deleteMenu (String tartgetMenu) {
		Connection con = null;
		
		try {
			con = ds.getConnection();
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
			ds.closeConnection(con);
		}
	}
	
	public void updateMenu (String columnName, int updateNumber, String targetMenu) {
		Connection con = null;
		
		try {
			con = ds.getConnection();
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
			ds.closeConnection(con);
		}
	}
	
	public void updateMenu (String columnName, String  updateString, String targetMenu) {
		Connection con = null;
		
		try {
			con = ds.getConnection();
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
			ds.closeConnection(con);
		}
	}

	
	public String getThumbnailPath(String menuName) throws SQLException {
	    Connection con = ds.getConnection();
	    String thumnail_path = null;
	    
	    String sql = "SELECT thumnail_path "
	    		+ "FROM menus "
	    		+ "WHERE menu_name = ?";
	    
	    PreparedStatement stmt = con.prepareStatement(sql);
	    stmt.setString(1, menuName);
	    
	    try {
	    	ResultSet rs = stmt.executeQuery();
			
	    	if (rs.next()) thumnail_path = rs.getString("THUMBNAIL_PATH");
        } catch (SQLException e) {
    		e.printStackTrace();
    	} finally {
    		ds.closeConnection(con);
    	}
	    
	    return thumnail_path;
	}
}

