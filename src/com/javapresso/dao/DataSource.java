package com.javapresso.dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DataSource {
	private static String url = "jdbc:oracle:thin:@192.168.0.29:1523/XEPDB1";

	private String username = "kcc";
	private String password = "kcc";
	
	static {
		try {
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
	public Connection getConnection() {
		Connection con = null;
		
		try {
			con = DriverManager.getConnection(url, username, password);
			System.out.println("oracle database 연결됨" + con);
		} catch (SQLException e) {
			System.out.println("데이터베이스 커넥션 에러 발생");
			System.out.println(e.getMessage());
		}
		
		return con;
	}
	
	public void closeConnection(Connection con) {
		if (con != null) try {con.close();} catch(Exception e) {}
	}
}