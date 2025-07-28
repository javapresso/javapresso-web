package com.javapresso.main;

import java.util.Scanner;

import com.javapresso.utils.EmployeeUI;
import com.javapresso.utils.RenderSystem;

public class EmployeeMain {
	private static Scanner read;
	private static RenderSystem renderSys;
	
	public EmployeeMain (Scanner read) {
		EmployeeMain.read = read;
		EmployeeMain.renderSys = new RenderSystem();
	}
	
	public void start() {
		EmployeeUI employeeInterAction = new EmployeeUI();
		
		boolean escape = false;
		while (true) {
			// 직원 관리 시스템 기능 출력 및 입력받기
			employeeInterAction.printFunction();
			String userInput = read.nextLine();
			renderSys.printEmptyLine(2);
			
			// 입력 확인
			switch (userInput) {
			case "1":
				employeeInterAction.insertEmployee(read);
				break;
			case "2":
				employeeInterAction.getEmployeeAll(read);
				break;
			case "3":
				employeeInterAction.updateEmployee(read);
				break;
			case "4":
//				employeeInterAction.deleteEmployee(read);
				break;
			case "Q":
			case "q":
			case "ㅂ":
				System.out.println("직원 관리 시스템을 종료합니다.");
				renderSys.printEmptyLine(2);
				escape = true;
				break;
			// 사용자 입력이 잘못된 경우 (1, 2, 3, 4, Q, q 의 입력만 기능 제공)
			default:
				renderSys.printInvalidInput();
				renderSys.printEmptyLine(2);
			}
			// 직원 관리 시스템 종료
			if (escape) { break; }
		}
	}
}
