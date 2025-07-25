package com.javapresso.web;

import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javapresso.handler.CommandHandler;
import com.javapresso.handler.InvalidActionHandler;


public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Map<String, CommandHandler> commandHandlerMap = new HashMap<>();
	
	public void init() throws ServletException {
		String configFile = getInitParameter("configFile");
		String configFilePath = getServletContext().getRealPath(configFile);
		
		System.out.println("init dispatcher Servlet" + configFilePath);
		Properties prop = new Properties(); // 설정파일로부터 정보를 쉽게 읽을수있다.
		
		try (
			FileReader reader = new FileReader(configFilePath)	
		) {
			prop.load(reader);
		} catch(IOException e) {
			throw new ServletException(e);
		}
		
		Iterator<?> keys = prop.keySet().iterator();
		while (keys.hasNext()) {
			String uri = (String)keys.next();
			String handlerClassName = prop.getProperty(uri);
			
			try {
				// class 이름으로 내가 원하는 타입의 Instance를 만든다.
				Class<?> handlerClass = Class.forName(handlerClassName);
				CommandHandler handlerInstance = (CommandHandler)handlerClass.getDeclaredConstructor().newInstance();
				commandHandlerMap.put(uri, handlerInstance);
				
			} catch (Exception e) {
				throw new ServletException(e);		
			}
		}
	};
	
	// 요청 URI를 획득해 해당하는 핸들러 인스턴스 객체를 가져와 process를 실행한뒤, 결과를 view 에 forward, redirect
	private void processServlet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String command = request.getRequestURI();
		
		CommandHandler handler = commandHandlerMap.get(command);

		if (handler == null) {
			handler = new InvalidActionHandler();
		}
		
		String viewPage = null;
		
		try {
			viewPage = handler.process(request, response);
			
			if ((viewPage != null) && (viewPage.indexOf("redirect:")==0)) {
				viewPage = viewPage.substring(9);
				response.sendRedirect(viewPage);
				return;
			}
		} catch(Exception e) {
			throw new ServletException(e);
		}
		
		if (viewPage != null) {
			viewPage = "/WEB-INF/views/" + viewPage;
		} else {
			viewPage = "/WEB-INF/views/index.jsp";
		}
		
		RequestDispatcher disp = request.getRequestDispatcher(viewPage);
		disp.forward(request, response);
	}
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processServlet(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processServlet(request, response);
	}
}
