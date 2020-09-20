package com.team.shoppingMall_119.serviceImpl;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSONObject;
import com.team.shoppingMall_119.AppConfi;
import com.team.shoppingMall_119.dao.UserRepository;
import com.team.shoppingMall_119.entity.User;
import com.team.shoppingMall_119.service.UserService;

@Service
@Transactional
public class UserServiceImpl implements UserService{
	public Integer nowUserId = 1;
	@Autowired
	private UserRepository uR;
	
	@Override
	public JSONObject saveUser(String nickName, Integer money) {
		// TODO Auto-generated method stub
		List<User> allUser = uR.findAll();
		List<String> allUserName = new ArrayList();
		for(int i = 0; i < allUser.size();i++) {
			allUserName.set(i, allUser.get(i).getUserName());
		}
		
		if(!allUserName.contains(nickName)) {
			User user = new User();
			user.setUserId(nowUserId);
			nowUserId ++;
			user.setUserName(nickName);
			user.setUserMoney(money);
			uR.saveAndFlush(user);
			JSONObject res = new JSONObject();
			res.put("message", "存入成功");
			res.put("meta", AppConfi.getMeta());
			return res;
		}else {
			return null;
		}
			
	}

	@Override
	public JSONObject getUserMoney(String nickName) {
		// TODO Auto-generated method stub
		User user = uR.findByUserName(nickName);
		Integer money = user.getUserMoney();
		JSONObject res = new JSONObject(true);
		
		res.put("message", money);
		res.put("meta", AppConfi.getMeta());
		return res;
	}

}
