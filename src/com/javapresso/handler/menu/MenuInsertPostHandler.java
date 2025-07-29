package com.javapresso.handler.menu;

import java.io.File;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.javapresso.dao.MenuDao;
import com.javapresso.handler.CommandHandler;
import com.javapresso.service.MenuService;

public class MenuInsertPostHandler implements CommandHandler {
	MenuService menuService = new MenuService();
	MenuDao menuDao = new MenuDao();
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		String osName = System.getProperty("os.name").toLowerCase();

		String uploadDirPath =  osName.contains("win")
				? request.getServletContext().getInitParameter("WIN_FILE_DIR")
				: request.getServletContext().getInitParameter("LINUX_FILE_DIR");
		
		System.out.println("[DEBUG] 업로드 경로(uploadDirPath): " + uploadDirPath);
		
		String fileName = "default_image.png";
		String relativeFilePath = fileName;
		
		try {
			// 1. 업로드된 파일 파트를 가지고 옴
			Part filePart = request.getPart("imageFile");
			System.out.println("[DEBUG] filePart: " + filePart);

			// 2. 사용자가 파일을 업로드하지 않으면 조건문 pass
			if (filePart != null && filePart.getSize() > 0) {
				System.out.println("[DEBUG] 업로드된 파일 크기: " + filePart.getSize());
				// 3. 사용자가 업로드한 파일의 확장자 
				String originalName = filePart.getSubmittedFileName();
			   System.out.println("[DEBUG] 원본 파일명: " + originalName);
			
				
				// 4. 파일 확장자 분리
				String ext = "";
				int i = originalName.lastIndexOf('.');
                if (i > 0) ext = originalName.substring(i);
                System.out.println("[DEBUG] 파일 확장자: " + ext);
                
                // 5. 중복 방지용으로 UUID를 써서 새 파일명 생성
                fileName = UUID.randomUUID().toString() + ext;
                System.out.println("[DEBUG] 저장할 파일명(UUID): " + fileName);
                
                // 6. 파일이 저장될 디렉터리 폴더 객체 생성
                File uploadDir = new File(uploadDirPath);
                System.out.println("[DEBUG] 파일 저장 폴더 존재? " + uploadDir.exists());
                if (!uploadDir.exists()) uploadDir.mkdirs();

                // 7. 업로드될 실제 파일 객체 생성
                File file = new File(uploadDir, fileName);
                System.out.println("[DEBUG] 실제 저장 경로: " + file.getAbsolutePath());
                
                // 8. 파일 데이터를 읽어서 지정된 위치에 저장
                try (InputStream input = filePart.getInputStream()) {
                	// 이미 파일이 있으면 덮어쓰는 옵션 REPLACE_EXISTING
                    Files.copy(input, file.toPath(), StandardCopyOption.REPLACE_EXISTING);
                    System.out.println("[DEBUG] 파일 저장 성공!");
                }

                // 9. DB에는 실제로 저장된 파일명을 변수명으로 저장
                relativeFilePath = fileName;
                System.out.println("[DEBUG] DB에 저장할 파일명(relativeFilePath): " + relativeFilePath);
			} else {
		        System.out.println("[DEBUG] 파일이 업로드되지 않음: 기본 이미지 사용");
		    }
		} catch (Exception e) {
			e.printStackTrace();
			fileName = "default_image.png";
			relativeFilePath = fileName;
			System.out.println("[DEBUG] 예외 발생: " + e.getMessage());
		}
			
		try {
			String subCategory = request.getParameter("selectedCategory");
			String menuName = request.getParameter("menu_name");
			int price = Integer.parseInt(request.getParameter("menu_price"));
			String description = request.getParameter("description");
			int iceable = "true".equals(request.getParameter("iceable")) ? 1 : 0;
			
			menuDao.insertMenu(subCategory, menuName, price, description, iceable, relativeFilePath);
		} catch(Exception e) {
			e.printStackTrace();
		}

		return "redirect:/menu";
	}
};
