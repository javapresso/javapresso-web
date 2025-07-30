package com.javapresso.handler.menu;

import java.io.File;
import java.io.InputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.javapresso.dao.MenuDao;
import com.javapresso.dto.MenuDto;
import com.javapresso.handler.CommandHandler;

public class MenuUpdatePostHandler implements CommandHandler {
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
	    String menuName = request.getParameter("menu_name");
	    String categoryName = request.getParameter("category_name");
	    String description = request.getParameter("description");
	    String filePath = request.getParameter("origin_path");
	    String originMenuName = request.getParameter("origin_name");
	    int price = Integer.parseInt(request.getParameter("menu_price"));
	    boolean iceable = "true".equals(request.getParameter("iceable")) ? true : false;
	
	    String osName = System.getProperty("os.name").toLowerCase();
        String uploadDirPath = osName.contains("win")
            ? request.getServletContext().getInitParameter("WIN_FILE_DIR")
            : request.getServletContext().getInitParameter("LINUX_FILE_DIR");

            // 1. 파일 업로드 파트 처리 (서블릿 3.0 이상 가정)
	        try {
	            Part filePart = request.getPart("imageFile");
	            if (filePart != null && filePart.getSize() > 0) {
	                // 원본 파일명
	                String originalName = filePart.getSubmittedFileName();
	                // 확장자 추출
	                String ext = "";
	                int i = originalName.lastIndexOf('.');
	                if (i > 0) ext = originalName.substring(i);
	                // UUID로 새 파일명 생성
	                String fileName = java.util.UUID.randomUUID().toString() + ext;
	                // 실제 저장 경로
	                File uploadDir = new File(uploadDirPath);
	                if (!uploadDir.exists()) uploadDir.mkdirs();
	                File file = new File(uploadDir, fileName);
	                try (InputStream input = filePart.getInputStream()) {
	                    java.nio.file.Files.copy(input, file.toPath(), java.nio.file.StandardCopyOption.REPLACE_EXISTING);
	                }
	                // DB에는 새 파일명 저장
	                filePath = fileName;
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	            // 파일 업로드 에러 시 기존 파일 사용 (filePath 변경 X)
	        }
        
		MenuDao menuDao = new MenuDao();
		MenuDto menuDto = new MenuDto();
		
		menuDto.setCategoryName(categoryName);
		menuDto.setDescription(description);
		menuDto.setIceable(iceable);
		menuDto.setMenuName(menuName);
		menuDto.setPrice(price);
		menuDto.setThumbnailPath(filePath);
		
		try {
			menuDao.updateMenuAll(originMenuName, menuDto);
		} catch (Exception e) {
			request.setAttribute("error", e.getMessage());
			
			return "error/runtime.jsp";
		}
		
		return "redirect:/menu";
	}
}
