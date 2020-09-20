package com.team.shoppingMall_119.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.alibaba.fastjson.JSONObject;
import com.team.shoppingMall_119.dao.*;
import com.team.shoppingMall_119.entity.*;


@RestController
@RequestMapping("test")
public class TestController {
	@Autowired
	private Cat1Repository cat1R;
	@Autowired
	private Cat2Repository cat2R;
	
	@Autowired
	private GoodRepository goodR;
	@Autowired
	private GoodCatRepository goodCatR;
	
	
	
	@GetMapping("/kang")
	@ResponseBody
	public JSONObject getKang() {
		List<Good> gl = goodR.findAll();
		String a = gl.get(0).getGoodAddTime().toString();
		System.out.print(a);
		return null;
	}
	
	@GetMapping("/mali")
	@ResponseBody
	public JSONObject getMali() {
		java.util.List<Cat2> l = cat2R.findAll();
		JSONObject j = new JSONObject();
		for(int i = 0; i < l.size();i++) {
			j.put(l.get(i).getCat2Id().toString(), l.get(i).getCat2Name());
		}
		return j;
	}
	
}
