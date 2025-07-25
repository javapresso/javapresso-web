package com.javapresso.dto;

import lombok.Data;

@Data
public class EmployeeDto {
	private int employeeId;
	private String employeeName;
	private String phoneNumber;
	private String title;
	private int salary;
	private int managerId;
}