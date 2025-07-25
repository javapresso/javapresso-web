package com.javapresso.dao;

import lombok.Data;

@Data
public class SideMenuItem {
	private String name;
	private String url;
	
	public SideMenuItem (String name, String url) {
		this.name = name;
		this.url = url;
	}
}
