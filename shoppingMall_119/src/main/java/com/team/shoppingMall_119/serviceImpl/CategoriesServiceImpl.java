package com.team.shoppingMall_119.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.team.shoppingMall_119.dao.*;
import com.team.shoppingMall_119.entity.*;
import com.team.shoppingMall_119.service.CategoriesService;
import com.team.shoppingMall_119.AppConfi;


@Service
@Transactional
public class CategoriesServiceImpl implements CategoriesService{

	@Autowired
	private Cat1Repository cat1R;
	@Autowired
	private Cat2Repository cat2R;
		
	@Override
	public JSONObject getCat() {
		JSONObject res = new JSONObject(true);
		// 得到所有的cat1
		List<Cat1> cat1List = cat1R.findAll();
		// 得到所有的cat2
		List<Cat2> cat2List = cat2R.findAll();
		// 创建message对应的JsonArray 
		JSONArray messageJsonArray = new JSONArray();

		for(int i = 0; i < cat1List.size();i++){
			// 创建临时的JSONObject
			JSONObject tempJsonObject = new JSONObject(true);
			// 得到临时的cat1
			Cat1 tempCat1 = cat1List.get(i);
			// 得到cat1的id
			Integer cat1_id = tempCat1.getCat1Id();
			// 得到cat1的name
			String cat1_name = tempCat1.getCat1Name();
			// 创建临时的JSONArray变量用来存cat2的字段
			JSONArray tempJsonArray = new JSONArray();

			for(int j = 0; j < cat2List.size(); j++){
				JSONObject tempJsonObject2 = new JSONObject(true);
				Cat2 tempCat2 = cat2List.get(j);
				Integer cat2_id = tempCat2.getCat2Id();
				String cat2_name = tempCat2.getCat2Name();
				String cat2_pic_src = AppConfi.URL + tempCat2.getCatImageSrc();
				if(cat2_id > cat1_id*10 && cat2_id < (cat1_id*10)+10){
					tempJsonObject2.put("cat2_id", cat2_id);
					tempJsonObject2.put("cat2_name", cat2_name);
					tempJsonObject2.put("cat2_pic_src", cat2_pic_src);
				}
				if(!tempJsonObject2.isEmpty()){
					tempJsonArray.add(tempJsonObject2);
				}
			}

			tempJsonObject.put("cat1_id", cat1_id);
			tempJsonObject.put("cat1_name", cat1_name);
			tempJsonObject.put("cat2", tempJsonArray);

			messageJsonArray.add(tempJsonObject);
		}

		res.put("message", messageJsonArray);

		JSONObject meta = new JSONObject();
		meta.put("msg", "获取成功");
		meta.put("status","200");

		res.put("meta", meta);


		return res;
	}

}
