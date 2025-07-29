package com.javapresso.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class AuthFilter implements Filter {
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpSession session = httpRequest.getSession();
        
        String userId = (String) session.getAttribute("userId");
        String userRole = (String) session.getAttribute("userRole");

        System.out.println("filter 실행" + userId + userRole);
        
        if (userId == null) {
        	request.setAttribute("error", "로그인이 필요한 페이지 입니다.");
        	request.getRequestDispatcher("/WEB-INF/views/error/authError.jsp").forward(request, response);
            return;
        }
        
        
        String currentPage = httpRequest.getRequestURI();
        String[] ownerOnlyPages = { "/employee" };
        
        if ("employee".equals(userRole)) {
            for (String ownerPage : ownerOnlyPages) {
                if (currentPage.contains(ownerPage)) {
                	request.setAttribute("error", "접근 권한이 없는 계정입니다.");
                	request.getRequestDispatcher("/WEB-INF/views/error/authError.jsp").forward(request, response);
                    return;
                }
            }
        }
		chain.doFilter(request, response);
	}

};
