package com.javapresso.main;
import java.util.Scanner;

import com.javapresso.utils.OrderUI;
import com.javapresso.utils.RenderSystem;

public class Main {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		RenderSystem renderSys = new RenderSystem();
		UserMenus userMenus = new UserMenus(sc);
		OrderUI orderUI = new OrderUI(sc);
		// 프로그램 시작. 로고 출력
		renderSys.printLogo();
		
		boolean run = true;
		
		while (run) {
            // 사용자 선택 화면
            renderSys.printTitle(renderSys.WIDTH, "카페 시스템");
            System.out.println(" 1. 카페 손님");
            System.out.println(" 2. 카페 직원");
            System.out.println(" 3. 카페 점장");
            System.out.println(" Q. 프로그램 종료");
            renderSys.printDivider(renderSys.WIDTH, true);
            
            renderSys.printInputForm();
            String input = sc.nextLine();
            renderSys.printEmptyLine(2);
            
            switch (input) {
                case "1":
                		orderUI.start();
                    break;
                case "2":
                    userMenus.showEmployeeMenu();
                    break;
                case "3":
                    userMenus.showOwnerMenu();
                    break;
                case "Q":
                case "q":
                case "ㅂ":
                    System.out.println("프로그램을 종료합니다.");
                    run = false;
                    break;
                default:
                    renderSys.printInvalidInput();
            }
        }

		sc.close();
	}
}
