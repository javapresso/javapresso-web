package com.javapresso.handler.employee;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javapresso.dao.EmployeeDao;
import com.javapresso.dto.EmployeeDto;
import com.javapresso.handler.CommandHandler;

public class EmployeeSelectHandler implements CommandHandler {
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// 직원 한명 조회하기 페이지
		EmployeeDao dao = new EmployeeDao();
		EmployeeDto emp = new EmployeeDto();
		
		String id = request.getParameter("id");
		emp = dao.getEmployee(id);
		request.setAttribute("emp", emp);
		
		return "employee/select.jsp";
	}
}
