package com.javapresso.handler.employee;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javapresso.dao.EmployeeDao;
import com.javapresso.dto.EmployeeDto;
import com.javapresso.handler.CommandHandler;

public class EmployeeSelectAllHandler implements CommandHandler {
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// 직원 전체 조회하기 페이지
		EmployeeDao dao = new EmployeeDao();
		ArrayList<EmployeeDto> empList = new ArrayList<>();
		empList = dao.getEmployeeAll();
		request.setAttribute("empList", empList);
		request.setAttribute("action", "select");

		return "employee/select_all.jsp";
	}
}
