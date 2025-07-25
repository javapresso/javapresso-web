package com.javapresso.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class ScheduleDto {
	private int scheduleId;
	private int employeeId;
	private Date startTime;
	private Date endTime;
}