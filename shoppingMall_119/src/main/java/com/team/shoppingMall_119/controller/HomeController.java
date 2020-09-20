package com.team.shoppingMall_119.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.team.shoppingMall_119.AppConfi;
import com.team.shoppingMall_119.service.HomeService;

@RestController
@RequestMapping("home")
public class HomeController {
	
	@Autowired
	private HomeService homeService;
	
	// 返回轮播图的具体地址
	@GetMapping("/swiperdata")
	@ResponseBody
	public JSONObject swiperdata() {
		return homeService.getSwiperData();
	}
	
	// 返回活动的图片的具体地址
	@GetMapping("/activity")
	@ResponseBody
	public JSONObject getActivity() {
		return homeService.getActivity();
	}
	
	// 商品展示
	@GetMapping("/show")
	@ResponseBody
	public JSONObject getGoodShow() {
		return homeService.getShow();
	}
}



