package com.team.shoppingMall_119.service;

import com.alibaba.fastjson.JSONObject;

public interface GoodService {

	//参数是商品名字
    public JSONObject searchByGoodName(String good_name);
    //参数是一级分类的id    
    public JSONObject searchByCat1Id(Integer cat1Id);
    //参数是二级分类的id    
    public JSONObject searchByCat2Id(Integer cat2Id);
    
    //没有参数，把所有的数据库中对应字段不是10的都取出来    
    public JSONObject searchByIsDiscut();
    
    //没有参数，把数据库中所有拼团为1的都取出来
    public JSONObject searchByIsGroupBuy();
    
    //没有参数，把近日上新的都取出来    
    public JSONObject searchByIsNew();
    
    //根据good_id返回商品的详情信息
    public JSONObject getDetailById(Integer good_id);
	
}
