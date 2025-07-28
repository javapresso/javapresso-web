package com.javapresso.handler.employee;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javapresso.dao.EmployeeDao;
import com.javapresso.handler.CommandHandler;

public class EmployeeUpdatePostHandler implements CommandHandler {
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// 직원 수정하기 
		EmployeeDao dao = new EmployeeDao();
		String id = request.getParameter("id");
		String target = request.getParameter("target");
		String value = request.getParameter("value");
		
		if ("name".equals(target)) {
			dao.updateEmployeeName(id, value);
		} else if ("phone".equals(target)) {
			dao.updateEmployeePhone(id, value);
		} else if ("title".equals(target)) {
			dao.updateEmployeeTitle(id, value);
		} else if ("salary".equals(target)) {
			dao.updateEmployeeSalary(id, value);
		}
		
		// 직원 전체 조회로 이동
		return "redirect:/employee/selectall";
	}
}
