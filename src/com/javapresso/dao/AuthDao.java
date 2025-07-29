package com.javapresso.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

import org.apache.tomcat.jdbc.pool.DataSource;

public class AuthDao {
	static DataSource dataSource = null;
	
	static {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource)context.lookup("java:comp/env/jdbc/Oracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
    
	public String getLogin(String id, String pw) {
		String result = null;
		
		try (Connection con = dataSource.getConnection()) {
	        String sql = "SELECT role FROM auth WHERE id = ? AND pw = ?";
	        PreparedStatement stmt = con.prepareStatement(sql);
	        
	        stmt.setString(1, id);
	        stmt.setString(2, pw);
	        
	        ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
	            String role = rs.getString("role");
	            System.out.println("db result" +  role);
	            if ("owner".equals(role) || "employee".equals(role)) result = role;

	            return result;
	        } else {
	        	return result;
	        }
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			return result;
		}
	}
}
