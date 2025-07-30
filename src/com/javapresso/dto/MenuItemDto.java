package com.javapresso.dto;

import lombok.Data;

@Data
public class MenuItemDto {
	public String parentName;
	public String categoryName;
	public String menuName;
	public int price;
	public String description;
	public int isSoldout;
	public int iceable;
	public String thumbnailPath;
}
