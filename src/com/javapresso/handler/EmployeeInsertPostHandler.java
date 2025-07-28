package com.javapresso.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javapresso.dao.EmployeeDao;

public class EmployeeInsertPostHandler implements CommandHandler {
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// 직원 추가하기
		EmployeeDao dao = new EmployeeDao();
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String title = request.getParameter("title");
		String salary = request.getParameter("salary");
		dao.insertEmployee(name, phone, title, salary);
		
		// 직원 전체 조회로 이동
		return "redirect:/employee/selectall";
	}
}
