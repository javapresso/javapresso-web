package com.javapresso.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Objects;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

import org.apache.tomcat.jdbc.pool.DataSource;

import com.javapresso.dto.EmployeeDto;

public class EmployeeDao {
	static DataSource dataSource = null;

	static {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource)context.lookup("java:comp/env/jdbc/Oracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 직원 추가하기
	 * @param name 추가할 직원의 이름
	 * @param phone 추가할 직원의 전화번호
	 * @param title 추가할 직원의 직급
	 * @param salary 추가할 직원의 급여
	 * @return 성공 1, 실패 0
	 */
	public int insertEmployee(String name, String phone, String title, String salary) {
		try (Connection con = dataSource.getConnection()) {
			String sql = "INSERT INTO employees "
					+ "(employee_id, employee_name, phone_number, title, salary) "
					+ "VALUES (emp_seq.NEXTVAL, ?, ?, ?, ?)";
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, name);
			stmt.setString(2, phone);
			stmt.setString(3, title);
			stmt.setInt(4, Integer.parseInt(salary));
			return stmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			return 0;
		}
	}

	/**
	 * 직원 조회하기
	 * @param id 조회할 직원 id
	 * @return 직원 데이터
	 */
	public EmployeeDto getEmployee(String id) {
		try (Connection con = dataSource.getConnection()) {
			String sql = "SELECT "
					+ "employee_id, employee_name, phone_number, "
					+ "title, salary, manager_id "
					+ "FROM employees "
					+ "WHERE employee_id = ?";
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setInt(1, Integer.parseInt(id));
			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
				EmployeeDto emp = new EmployeeDto();
				emp.setEmployeeId(rs.getInt("employee_id"));
				emp.setEmployeeName(rs.getString("employee_name"));
				emp.setPhoneNumber(rs.getString("phone_number"));
				emp.setTitle(rs.getString("title"));
				emp.setSalary(rs.getInt("salary"));
				emp.setManagerId(rs.getInt("manager_id"));

				return emp;
			} else { return null; }
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			return null;
		}
	}

	/**
	 * 직원 전체 조회하기
	 * @return 직원 데이터 리스트
	 */
	public ArrayList<EmployeeDto> getEmployeeAll() {
		try (Connection con = dataSource.getConnection()) {
			String sql = "SELECT "
					+ "e.employee_id AS employee_id, e.employee_name AS employee_name, "
					+ "e.phone_number AS phone_number, title, salary, manager_id, "
					+ "NVL(rst.total_price, 0) AS performance "
					+ "FROM employees e LEFT JOIN ("
					+ "SELECT s.employee_id, SUM(m.price) AS total_price "
					+ "FROM schedule s LEFT JOIN orders o "
					+ "ON o.order_date BETWEEN s.start_time AND s.end_time "
					+ "LEFT JOIN menus m ON o.menu_name = m.menu_name "
					+ "WHERE TRUNC(s.start_time, 'MM') = TRUNC(SYSDATE, 'MM') "
					+ "GROUP BY s.employee_id) rst "
					+ "ON e.employee_id = rst.employee_id "
					+ "ORDER BY e.employee_id";
			PreparedStatement stmt = con.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();

			ArrayList<EmployeeDto> empList = new ArrayList<>();
			while (rs.next()) {
				EmployeeDto emp = new EmployeeDto();
				emp.setEmployeeId(rs.getInt("employee_id"));
				emp.setEmployeeName(rs.getString("employee_name"));
				emp.setPhoneNumber(rs.getString("phone_number"));
				emp.setTitle(rs.getString("title"));
				emp.setSalary(rs.getInt("salary"));
				emp.setManagerId(rs.getInt("manager_id"));

				empList.add(emp);
			}

			return empList;
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			return null;
		}
	}

	/**
	 * 직원 수정하기 (이름 수정)
	 * @param id 수정될 직원 id
	 * @param name 수정될 이름
	 * @return 성공 1, 실패 0
	 */
	public int updateEmployeeName(String id, String name) {
		// 수정하려는 직원이 존재하는지 확인
		if (Objects.isNull(this.getEmployee(id))) { return 0; }

		try (Connection con = dataSource.getConnection()) {
			String sql = "UPDATE employees "
					+ "SET employee_name = ? "
					+ "WHERE employee_id = ?";
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1,  name);
			stmt.setInt(2,  Integer.parseInt(id));

			return stmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			return 0;
		}
	}

	/**
	 * 직원 수정하기 (전화번호 수정)
	 * @param id 수정될 직원 id
	 * @param phone 수정될 전화번호
	 * @return 성공 1, 실패 0
	 */
	public int updateEmployeePhone(String id, String phone) {
		// 수정하려는 직원이 존재하는지 확인
		if (Objects.isNull(this.getEmployee(id))) { return 0; }

		try (Connection con = dataSource.getConnection()) {
			String sql = "UPDATE employees "
					+ "SET phone_number = ? "
					+ "WHERE employee_id = ?";
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1,  phone);
			stmt.setInt(2,  Integer.parseInt(id));

			return stmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			return 0;
		}
	}

	/**
	 * 직원 수정하기 (급여 수정)
	 * @param id 수정될 직원 id
	 * @param salary 수정될 급여
	 * @return 성공 1, 실패 0
	 */
	public int updateEmployeeSalary(String id, String salary) {
		// 수정하려는 직원이 존재하는지 확인
		if (Objects.isNull(this.getEmployee(id))) { return 0; }

		try (Connection con = dataSource.getConnection()) {
			String sql = "UPDATE employees "
					+ "SET salary = ? "
					+ "WHERE employee_id = ?";
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1,  salary);
			stmt.setInt(2,  Integer.parseInt(id));

			return stmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			return 0;
		}
	}

	/**
	 * 직원 수정하기 (직급 수정)
	 * @param id 수정될 직원 id
	 * @param name 수정될 직급
	 * @return 성공 1, 실패 0
	 */
	public int updateEmployeeTitle(String id, String title) {
		// 수정하려는 직원이 존재하는지 확인
		if (Objects.isNull(this.getEmployee(id))) { return 0; }

		try (Connection con = dataSource.getConnection()) {
			String sql = "UPDATE employees "
					+ "SET title = ? "
					+ "WHERE employee_id = ?";
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1,  title);
			stmt.setInt(2,  Integer.parseInt(id));

			return stmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			return 0;
		}
	}

	/**
	 * 직원 수정하기 (관리자 id 수정)
	 * @param id 수정될 직원 id
	 * @param manager_id 수정될 관리자 id
	 * @return 성공 1, 실패 0
	 */
	public int updateEmployeeManager(String id, String manager_id) {
		// 수정하려는 직원이 존재하는지 확인
		if (Objects.isNull(this.getEmployee(id))) { return 0; }

		// 수정될 관리자 id의 직원이 존재하는지 확인
		if (Objects.isNull(this.getEmployee(manager_id))) { return 0; }

		try (Connection con = dataSource.getConnection()) {
			// 직원의 관리자 수정
			String sql = "UPDATE employees "
					+ "SET manager_id = ? "
					+ "WHERE employee_id = ?";
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1,  manager_id);
			stmt.setInt(2,  Integer.parseInt(id));

			return stmt.executeUpdate();				
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			return 0;
		}
	}

	/** 
	 * 직원 삭제하기
	 * @param id 삭제할 직원 아이디
	 * @return 성공 1, 실패 0
	 */
	public int deleteEmployee(String id) {
		// 삭제하려는 직원이 존재하는지 확인
		if (Objects.isNull(this.getEmployee(id))) { return 0; }

		Connection con = null;
		try {
			con = dataSource.getConnection();

			// 삭제할 직원을 관리자로 둔 직원이 존재하는지 확인
			String sql1 = "SELECT "
					+ "employee_id, manager_id "
					+ "FROM employees "
					+ "WHERE manager_id = ?";
			PreparedStatement stmt1 = con.prepareStatement(sql1);
			stmt1.setInt(1, Integer.parseInt(id));
			ResultSet rs = stmt1.executeQuery();
			if (rs.next()) { return 0; }

			// 직원의 스케쥴 정보와 직원 정보가 삭제를 함께 적용하거나 미적용될 수 있도록 auto commit 끄기
			con.setAutoCommit(false);

			// 삭제할 직원의 스케쥴 삭제
			String sql2 = "DELETE FROM schedule WHERE employee_id = ?";
			PreparedStatement stmt2 = con.prepareStatement(sql2);
			stmt2.setInt(1,  Integer.parseInt(id));
			stmt2.executeUpdate();

			// 직원 정보 삭제
			String sql3 = "DELETE FROM employees WHERE employee_id = ?";
			PreparedStatement stmt3 = con.prepareStatement(sql3);
			stmt3.setInt(1, Integer.parseInt(id));
			int deleteResult = stmt3.executeUpdate();

			// 삭제 성공시 적용, 실패시 미적용
			if (deleteResult == 1) {
				con.commit();
				return 1;
			} else {
				con.rollback();
				return 0;
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			return 0;
		} finally {
			try { con.setAutoCommit(true); } catch (Exception e) { }
			if (con != null) try { con.close(); } catch (Exception e) { }
		}
	}
}
