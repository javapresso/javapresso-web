package com.javapresso.service;

import java.util.ArrayList;
import java.util.List;

import com.javapresso.dao.MenuDao;

public class MenuService {
    public List<String> getSubCategories(String parentId) {
    	MenuDao menuDao = new MenuDao();
    	List<String> subCategories = new ArrayList<>();
    	
    	subCategories = menuDao.getChildCategories(parentId);
    	
        return subCategories;
    }
}