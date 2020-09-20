package com.team.shoppingMall_119.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.alibaba.fastjson.JSONObject;
import com.team.shoppingMall_119.service.UserService;


@RestController
@RequestMapping("user")
public class UserController {

	@Autowired
	private UserService userService;
	
	
    @GetMapping("/detail")
    @ResponseBody
    public JSONObject postUserDetail(@RequestParam(name = "nick_name",required = true) String nickName ,
                                     @RequestParam(name = "money", required = true) Integer money){
    	System.out.println("-nick_name--------------------");
    	System.out.println(nickName);
    	System.out.println(money);
    	
    	System.out.println("-nick_name--------------------");
    	
        userService.saveUser(nickName, money);
    	return null;
    }
    
    @GetMapping("/money")
    @ResponseBody
    public JSONObject getMoney(@RequestParam(name = "nick_name",required = true) String nickName) {
    	System.out.println(nickName);
    	return userService.getUserMoney(nickName);
    }
    
}
