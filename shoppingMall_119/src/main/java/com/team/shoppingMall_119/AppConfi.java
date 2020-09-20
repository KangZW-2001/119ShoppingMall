package com.team.shoppingMall_119;

import java.util.Random;

import com.alibaba.fastjson.JSONObject;

public interface AppConfi {
	
	public static final String URL = "http://172.23.14.251:8080/";
	public static final Integer GOODTYPENUMBER = 50;
	public static final Integer HOMEGOODNUMBER = 10;
	public static final Integer GOODISGROUPBUY = 1;
	public static final Integer SWIPERDATANUM = 5;

	public static Integer[] getRandomGoodNum(int number) {
		
//		  随机生成指定的商品id
		Random r = new Random();
		Integer[] res = new Integer[number];
		for(int i = 0; i < number; i ++) {
			int temp = r.nextInt(GOODTYPENUMBER);
//			System.out.println("-------------------------------");
//			System.out.println(res[i]);
//
//			System.out.println("-------------------------------");
			res[i] = temp;
		}
		return res;
		
//		Integer[] res = new Integer[5];
//		for(int i = 0; i < 5;i ++) {
//			res[i] = i+1;
//		}
//		return res;
	}
	
	public static String[] getSrcArray(String str) {
		String[] strArray = str.split(",");
		for(int i = 0; i < strArray.length;i++) {
			strArray[i] = URL + strArray[i];
		}
		return strArray;
	}
	
	public static JSONObject getMeta() {
		JSONObject meta = new JSONObject(true);
		meta.put("msg", "获取成功");
		meta.put("status", 200);
		return meta;
	}
}
