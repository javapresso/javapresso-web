package com.javapresso.handler.employee;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javapresso.dao.EmployeeDao;
import com.javapresso.handler.CommandHandler;

public class EmployeeDeletePostHandler implements CommandHandler {
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// 직원 삭제하기 
		EmployeeDao dao = new EmployeeDao();
		String id = request.getParameter("id");
		dao.deleteEmployee(id);
		
		// 직원 전체 조회로 이동
		return "redirect:/employee/selectall";
	}
}
