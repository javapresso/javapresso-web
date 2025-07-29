package com.javapresso.filter;

import java.io.IOException;
import java.util.Locale;

import javax.servlet.*;
import javax.servlet.http.*;

public class LocaleFilter implements Filter {
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// 초기화 파라미터가 있으면 여기서 읽을 수 있음
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession(false);

		// 세션에 언어가 이미 설정되어 있지 않은 경우에만 브라우저 언어 감지
		if (session != null && session.getAttribute("selectedLocale") == null) {
			Locale browserLocale = req.getLocale();  // 브라우저 설정 언어 감지
			session.setAttribute("selectedLocale", browserLocale);
		}

		chain.doFilter(request, response);
	}

	@Override
	public void destroy() {}
}
