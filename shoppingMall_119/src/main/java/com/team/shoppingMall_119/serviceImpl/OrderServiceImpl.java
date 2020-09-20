package com.team.shoppingMall_119.serviceImpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.team.shoppingMall_119.AppConfi;
import com.team.shoppingMall_119.dao.FormRepository;
import com.team.shoppingMall_119.dao.GoodFormRepository;
import com.team.shoppingMall_119.dao.GoodRepository;
import com.team.shoppingMall_119.dao.UserRepository;
import com.team.shoppingMall_119.entity.Form;
import com.team.shoppingMall_119.entity.Good;
import com.team.shoppingMall_119.entity.GoodForm;
import com.team.shoppingMall_119.entity.User;
import com.team.shoppingMall_119.service.OrderService;

@Service
@Transactional
public class OrderServiceImpl implements OrderService{
	
	public Integer FormNowId = 1;
	
	@Autowired
	private UserRepository uR;
	@Autowired
	private FormRepository fR;
	@Autowired
	private GoodFormRepository gFR;
	@Autowired
	private GoodRepository gR;
	
	@Override
	public JSONObject createOrder(JSONObject jo) {
		// TODO Auto-generated method stub
		//订单的信息 --> 用户名 ，订单日期，订单总数量，订单总价，商品数组 
		String nickName = jo.getString("nick_name");
		String formDate = jo.getString("form_date");
		Integer formNum = jo.getInteger("form_num");
		Integer formPrice = jo.getInteger("form_price");
		//包含好几个good的JSON对象 good --> good_id 和 num		
		String goodsInfoStr =  jo.getString("goods");
		
		//得到 "13:1" 和  "66:1"		
		String [] goodInfoArray = goodsInfoStr.split(";");
		String goodIdStr = "";
		String goodNumStr = "";
		for(int i = 0;i < goodInfoArray.length;i++) {
			goodIdStr = goodIdStr + goodInfoArray[i].split(":")[0]+",";
			goodNumStr = goodNumStr + goodInfoArray[i].split(":")[1]+",";
		}
		
		//得到用户的id		
		Integer userId = uR.findByUserName(nickName).getUserId();
		
		User user = uR.findByUserId(userId);
		
//		User newUser = new User();
//		newUser.setUserId(userId);
//		newUser.setUserName(nickName);
//		newUser.setUserMoney(user.getUserMoney()-formPrice);
//		
		user.setUserMoney(user.getUserMoney()-formPrice);
		
		uR.save(user);
		
		//创建form的实例		
		Form form = new Form();
		form.setFormId(FormNowId);
		FormNowId ++;
		form.setUserId(userId);
		form.setFormPrice(formPrice);
		form.setFormState(2);
		form.setFormDate(formDate);
		form.setFormNum(formNum);
		fR.saveAndFlush(form);
		
		GoodForm goodForm = new GoodForm();
		goodForm.setFormId(FormNowId-1);
		goodForm.setGoodId(goodIdStr);
		goodForm.setGoodNumber(goodNumStr);
		gFR.save(goodForm);
		
//		JSONObject res = new JSONObject();
//		res.put("message", "成功");
//		res.put("meta",AppConfi.getMeta());
		return null;
	}

	@Override
	public JSONObject findOrderByStateAndNickName(Integer state, String nickName) {
		// TODO Auto-generated method stub
		// 获得所有符合要求的订单 --> formList		
		User user = uR.findByUserName(nickName);
		// 得到 userId
		Integer userId = user.getUserId();
		// 得到所有的订单
		List<Form> formAllList = fR.findAll();
		List<Form> formList;
		if(state != 0) {
			//	根据用户的id和state从所有订单中选出相应的订单			
			formList = findOrderByState(formAllList, state, userId);
		}else {
			//	根据用户的id获得所有的订单			
			formList = findOrderByUserId(formAllList,userId);
		}

		System.out.println("-------------------");
		for(int i = 0; i < formList.size();i++){
			System.out.println(formList.get(i).getFormId());
		}
		System.out.println("-------------------");

		//	创建返回的 数组 和 json对象		
		JSONObject res = new JSONObject(true);
		JSONArray resArray = new JSONArray();
		// 根据订单的id去找对应的好几个商品		
		for(int i = 0; i < formList.size();i++) {
			JSONObject formJO = new JSONObject(true);
			// 得到除了商品之外的所有信息
			Integer formId = formList.get(i).getFormId();
			String formDate = formList.get(i).getFormDate();
			Integer formPrice = formList.get(i).getFormPrice();
			Integer formNum = formList.get(i).getFormNum();
			Integer formState = formList.get(i).getFormState();

			// 得到 1,2,3,4 类似的goodIdStr
			String goodIdStr = gFR.findByFormId(formId).getGoodId();
			String [] goodIdStrArray = goodIdStr.split(",");
			Integer [] goodIdArray = new Integer[goodIdStrArray.length];
			
			
			// 得到 1,2,3,4 类似的goodNumArray
			String goodNumStr = gFR.findByFormId(formId).getGoodNumber();
			String [] goodNumStrArray = goodNumStr.split(",");
			Integer [] goodNumArray = new Integer[goodIdStrArray.length];
			for(int i1 = 0;i1 < goodIdStrArray.length;i1++) {
				goodIdArray[i1] = Integer.valueOf(goodIdStrArray[i1]);
				goodNumArray[i1] = Integer.valueOf(goodNumStrArray[i1]);
			}
			
			
			
			JSONArray goodArray = new JSONArray();
			for(int j = 0; j < goodIdArray.length;j++){
				JSONObject tempGoodJO = new JSONObject(true);
				
				Good g = gR.findByGoodId(goodIdArray[j]);
				
				if(g == null) {
					System.out.println(g.getGoodName());
					System.out.println(g.getGoodPrice());
					System.out.println("找不到good");
				}else {

					System.out.println(g.getGoodName());

					System.out.println(g.getGoodPrice());
					System.out.println("找到good了");
				}
				
				Integer goodPrice = g.getGoodPrice();
				tempGoodJO.put("good_id",goodIdArray[j]);
				tempGoodJO.put("goods_num", goodNumArray[j]);
				tempGoodJO.put("goods_price", goodPrice);
				tempGoodJO.put("good_name", g.getGoodName());
				if(!tempGoodJO.isEmpty()){
					goodArray.add(tempGoodJO);
				}
			}

			formJO.put("form_id", formId);
			formJO.put("form_date", formDate);
			formJO.put("form_price", formPrice);
			formJO.put("form_num", formNum);
			formJO.put("form_state", formState);
			formJO.put("goods", goodArray);
			if(!formJO.isEmpty()) {
				resArray.add(formJO);
			}
		}
		
		res.put("message", resArray);
		res.put("meta", AppConfi.getMeta());
		return res;
	}
	
	private List<Form> findOrderByState(List<Form> all, Integer state, Integer userId) {
		List<Form> res = new ArrayList<Form>();
		for(int i = 0; i < all.size();i++) {
			if(all.get(i).getFormState() == state && all.get(i).getUserId() == userId) {
				res.add(all.get(i));
			}
		}
		return res;
	}
	
	private List<Form> findOrderByUserId(List<Form> all, Integer userId){
		List<Form> res = new ArrayList<Form>();
		for(int i = 0; i < all.size();i++) {
			if(all.get(i).getUserId() == userId) {
				res.add(all.get(i));
			}
		}
		return res;
	}
	
}
