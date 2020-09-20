package com.team.shoppingMall_119.service;

import com.alibaba.fastjson.JSONObject;

public interface UserService {
	public JSONObject saveUser(String nickName, Integer money);
	
	public JSONObject getUserMoney(String nickName);
}
