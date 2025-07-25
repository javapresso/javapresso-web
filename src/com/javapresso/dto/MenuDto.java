package com.javapresso.dto;

import lombok.Data;

@Data
public class MenuDto {
	private String categoryName;
	private String menuName;
	private int price;
	private String description;
	private boolean isSoldout;
	private boolean iceable;
}