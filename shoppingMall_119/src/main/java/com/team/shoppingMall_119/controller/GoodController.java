package com.team.shoppingMall_119.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.alibaba.fastjson.JSONObject;
import com.team.shoppingMall_119.dao.GoodRepository;
import com.team.shoppingMall_119.entity.Good;
import com.team.shoppingMall_119.service.GoodService;
import com.team.shoppingMall_119.AppConfi;

@RestController
@RequestMapping("good")
public class GoodController {
	
	@Autowired
	private GoodRepository gr;
	
	@Autowired
	private GoodService goodS;
	
    // 根据good_name返回具体查询到的结果
	// 每次只会发过来一个参数	
    @GetMapping("/search")
    @ResponseBody
    public JSONObject searchGood(@RequestParam(name = "keyword",required = false) String good_name,
    							 @RequestParam(name = "cat1_id",required = false) Integer cat1_id,
    							 @RequestParam(name = "cat2_id",required = false) Integer cat2_id,
    							 @RequestParam(name = "is_discut",required = false) boolean is_discut,
    							 @RequestParam(name = "is_groupbuy",required = false) boolean is_groupbuy,
    							 @RequestParam(name = "is_new",required = false) boolean is_new){
    	
    	System.out.println(good_name);
    	System.out.println(cat1_id);
    	System.out.println(cat2_id);
    	System.out.println(is_discut);
    	System.out.println(is_groupbuy);
    	System.out.println(is_new);
    	
    	
    	if(cat1_id > 0) {
    		// 根据good_name找到匹配的商品   	
//    		return AppConfi.getMeta();

//    		System.out.println("用cat1搜索了");
    		return goodS.searchByCat1Id(cat1_id);
    	}else if(!good_name.equals("undefined")) {
    	 	
//    		return AppConfi.getMeta();
    		
//    		System.out.println("用名字搜索了");
    		
    		return goodS.searchByGoodName(good_name);
    	}
    	else if(cat2_id > 10) {

//    		System.out.println("用cat2搜索了");
    		
//    		return AppConfi.getMeta();
    		return goodS.searchByCat2Id(cat2_id);
    	}
    	else if(is_discut) {
    	 	

//    		System.out.println("用打折搜索了");
    		
//    		return AppConfi.getMeta();
    		return goodS.searchByIsDiscut();
    	}else if(is_groupbuy){

    		System.out.println("用拼团搜索了");
//    		return AppConfi.getMeta();
    		return goodS.searchByIsGroupBuy();
    	}else {

//    		System.out.println("用上新搜索了");
//    		return AppConfi.getMeta();
    		return goodS.searchByIsNew();
    		
    	}
    }

    // 根据具体情况返回具体的内容
    @GetMapping("/detail")
    @ResponseBody
    public JSONObject getDetail(@RequestParam(name = "good_id",required = true) Integer good_id){
        
    	return goodS.getDetailById(good_id);
    }
    
    @GetMapping("/test/{id}")
    @ResponseBody
    public JSONObject getTest(@PathVariable("id") Integer id) {
		Good g = gr.findByGoodId(id);
		JSONObject jb = new JSONObject();
		jb.put("good_name", g.getGoodName());
		jb.put("good_add_time", g.getGoodAddTime());
		jb.put("good_reserve", g.getGoodReserve());
    	return jb;
    }
    
}
