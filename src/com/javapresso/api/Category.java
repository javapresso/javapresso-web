package com.javapresso.api;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.javapresso.service.MenuService;

@WebServlet("/api/menu/subcategories")
public class Category extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private MenuService service = new MenuService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	System.out.println("get 요청 들어옴!");
    	String parentId = request.getParameter("parentId");
        List<String> subCategories = service.getSubCategories(parentId);

        System.out.println("subCategories 결과: "+ subCategories);
        Gson gson = new Gson();
        String json = gson.toJson(subCategories);

        System.out.println("json: " + json);
        response.setContentType("application/json;charset=UTF-8");
        response.getWriter().write(json);
    }
}

