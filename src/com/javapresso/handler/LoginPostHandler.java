package com.javapresso.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javapresso.dao.AuthDao;

public class LoginPostHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		AuthDao authDao = new AuthDao();
		String url = "error/authError.jsp";
		String id = request.getParameter("username");
	    String pw = request.getParameter("password");
	    
	    String result = authDao.getLogin(id, pw);

	    System.out.println("result" +  result);
	    if (result == null) {
	    	session.invalidate();
	    	
	    	request.setAttribute("error", "일치하는 계정이 존재하지 않습니다.");
	    	url= "error/authError.jsp";
	    } else {
	    	session.setAttribute("userId", id);
	    	session.setAttribute("userRole", result);
	    	
	    	if ("owner".equals(result)) {
	    		url= "redirect:/employee";
            } else if ("employee".equals(result)) {
            	url="redirect:/menu";
            }
	    }
	    
	    return url;
	}
}
