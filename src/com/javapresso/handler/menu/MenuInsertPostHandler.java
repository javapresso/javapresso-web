package com.javapresso.handler.menu;

import java.io.File;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.javapresso.dao.MenuDao;
import com.javapresso.handler.CommandHandler;
import com.javapresso.service.MenuService;

public class MenuInsertPostHandler implements CommandHandler {
	private static final String UPLOAD_DIR = "/media/sf_shared_images";
	MenuService menuService = new MenuService();
	MenuDao menuDao = new MenuDao();
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		String uploadDirPath = request.getServletContext().getInitParameter("UPLOAD_DIR");
		String fileName = "default_image.png";
		String relativeFilePath = fileName;
		
		try {
			Part filePart = request.getPart("imageFile");
			
			if (filePart != null && filePart.getSize() > 0) {
			    fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

			    File uploadDir = new File(UPLOAD_DIR);
			    if (!uploadDir.exists()) uploadDir.mkdirs();

			    File file = new File(uploadDir, fileName);
			    try (InputStream input = filePart.getInputStream()) {
			        Files.copy(input, file.toPath(), StandardCopyOption.REPLACE_EXISTING);
			    }
			}
		} catch (Exception e) {
			e.printStackTrace();
			fileName = "default_image.png";
		}
			
		try {
			String subCategory = request.getParameter("selectedCategory");
			String menuName = request.getParameter("menu_name");
			int price = Integer.parseInt(request.getParameter("menu_price"));
			String description = request.getParameter("description");
			int iceable = request.getParameter("iceable").equals("true") ? 1 : 0;
			
			menuDao.insertMenu(subCategory, menuName, price, description, iceable, fileName);
		} catch(Exception e) {
			e.printStackTrace();
		}

		return "redirect:/menu";
	}
};
