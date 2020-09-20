package com.team.shoppingMall_119.serviceImpl;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Random;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.team.shoppingMall_119.AppConfi;
import com.team.shoppingMall_119.dao.GoodRepository;
import com.team.shoppingMall_119.entity.Good;
import com.team.shoppingMall_119.service.HomeService;

@Service
@Transactional
public class HomeSerivceImpl implements HomeService{
	@Autowired
	private GoodRepository goodR;
	
	@Override
	public JSONObject getSwiperData() {
		// TODO Auto-generated method stub		
		Good [] goodArray = new Good[AppConfi.SWIPERDATANUM];
		JSONObject jo = new JSONObject(true);
		JSONObject meta = new JSONObject(true);
		JSONArray ja = new JSONArray();
		String [] srcArray = new String[4];
		
		Integer [] idArray = AppConfi.getRandomGoodNum(AppConfi.SWIPERDATANUM);
		
	
		for(int i = 0; i < AppConfi.SWIPERDATANUM; i ++) {
			goodArray[i] = goodR.findByGoodId(idArray[i]);
		}
		
		for(int i = 0; i < AppConfi.SWIPERDATANUM;i ++) {
			JSONObject temp = new JSONObject(true);
			temp.put("image_src", AppConfi.getSrcArray(goodArray[i].getGoodPics())[0]);
			temp.put("good_id",idArray[i]);
			ja.add(temp);
		}
		//JSON对象先放的在前面		
		meta.put("msg","获取成功");
		meta.put("status", 200);
		jo.put("message", ja);
		jo.put("meta", meta);
		return jo;
	}

	@Override
	public JSONObject getActivity() {
		// TODO Auto-generated method stub
		JSONObject jo = new JSONObject ();
		
		JSONArray ja = new JSONArray();
		
		String [] activityPath = new String[3];
		activityPath[0] = AppConfi.URL + "groupBuy/group.png";
		activityPath[1] = AppConfi.URL + "recentNew/new.png";
		activityPath[2] = AppConfi.URL + "todayDiscut/discut.png";
		
		for(int i = 0; i < 3; i++) {
			JSONObject temp = new JSONObject();
			temp.put("image_src",activityPath[i]);
			ja.add(temp);
		}
		
		jo.put("message", ja);
		return jo;
	}

	@Override
	public JSONObject getShow() {
//		// TODO Auto-generated method stub
//		Good [] goodArray = new Good[AppConfi.HOMEGOODNUMBER];

		Integer [] idArray = AppConfi.getRandomGoodNum(AppConfi.HOMEGOODNUMBER);
		
		
		JSONObject res = new JSONObject(true);
		JSONArray ja = new JSONArray();
		JSONObject meta = new JSONObject(true);
		
		for(int i = 0; i < idArray.length; i++) {
			
			System.out.print(idArray[i] + " ");
			
			Good tempGood = goodR.findByGoodId(idArray[i]);
			String[] srcArray = AppConfi.getSrcArray(tempGood.getGoodPics());
			JSONObject temp = new JSONObject(true);
			temp.put("good_id",idArray[i]);
			temp.put("good_name",tempGood.getGoodName());
			temp.put("good_price", tempGood.getGoodPrice());
			temp.put("image_src", srcArray[0]);
			
			ja.add(temp);
		}
		
		meta.put("meg", "获取成功");
		meta.put("status", "200");
		res.put("message", ja);
		res.put("meta", meta);
		
		return res;
	}

	
	
	
}
