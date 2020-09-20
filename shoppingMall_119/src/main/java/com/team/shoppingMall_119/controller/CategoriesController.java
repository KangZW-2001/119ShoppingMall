package com.team.shoppingMall_119.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.alibaba.fastjson.JSONObject;
import com.team.shoppingMall_119.service.CategoriesService;

@RestController
@RequestMapping("categories")
public class CategoriesController {
	
	@Autowired
	CategoriesService categoriesService;
	
	@GetMapping("/cat")
    @ResponseBody
    public JSONObject getCategories(){
        return categoriesService.getCat();
    }
}
