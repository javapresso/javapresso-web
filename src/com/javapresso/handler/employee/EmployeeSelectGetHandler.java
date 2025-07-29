package com.javapresso.handler.employee;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javapresso.dao.EmployeeDao;
import com.javapresso.dto.EmployeeDto;
import com.javapresso.handler.CommandHandler;

public class EmployeeSelectGetHandler implements CommandHandler {
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// 직원 한명 조회하기 페이지
		EmployeeDao dao = new EmployeeDao();
		EmployeeDto emp = new EmployeeDto();
		
		String id = request.getParameter("id");
		if (id == null) {
			return "error/error404.jsp";
		}
		
		emp = dao.getEmployee(id);
		if (emp == null) {
			return "error/error404.jsp";
		}
		request.setAttribute("emp", emp);			
		
		return "employee/select_id.jsp";
	}
}
