package com.javapresso.dto;
import java.sql.Date;

import lombok.Data;

@Data
public class Category {
	private String categoryName;
	private String parentName;
}