package com.team.shoppingMall_119.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.alibaba.fastjson.JSONObject;
import com.team.shoppingMall_119.service.OrderService;
import com.team.shoppingMall_119.AppConfi;

@RestController
@RequestMapping("form")
public class OrderController {
	
	@Autowired
	private OrderService orderService;
	
	@GetMapping("/create")
	@ResponseBody
	public JSONObject createForm(@RequestParam(name = "nick_name", required = true) String nickName,
								 @RequestParam(name = "form_date", required = true) String formData,
								 @RequestParam(name = "form_price", required = true) Integer formPrice,
								 @RequestParam(name = "form_num", required = true) Integer formNum,
								 @RequestParam(name = "goods", required = true) String goods) {
//		nick_name , form_date, form_price,form_num,address, array[] goods 
		JSONObject jo = new JSONObject(true);
		jo.put("nick_name", nickName);
		jo.put("form_data", formData);
		jo.put("form_price", formPrice);
		jo.put("form_num", formNum);
		
		jo.put("goods", goods);
		
		orderService.createOrder(jo);
		
		JSONObject res = new JSONObject(true);
		JSONObject temp = new JSONObject(true);
		temp.put("state", 1);
		res.put("message", temp);
		res.put("meta", AppConfi.getMeta());
		return res;
	}
	
	@GetMapping("/detail")
	@ResponseBody
	public JSONObject getFormDetail(@RequestParam(name = "state", required = true) Integer state ,
									@RequestParam(name = "nick_name", required = true) String nickName) {
		
		System.out.println(state);
		System.out.println(nickName);
		
		return orderService.findOrderByStateAndNickName(state, nickName);
	}

}
