package com.team.shoppingMall_119.service;

import com.alibaba.fastjson.JSONObject;

public interface OrderService {
	//创建订单	
	public JSONObject createOrder(JSONObject jo);
	
	public JSONObject findOrderByStateAndNickName(Integer state, String nickName);
}
