package com.javapresso.handler.employee;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javapresso.handler.CommandHandler;

public class EmployeeInsertHandler implements CommandHandler {
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// 직원 추가하기 페이지
		return "employee/insert.jsp";
	}
}
