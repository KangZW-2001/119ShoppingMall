package com.team.shoppingMall_119.serviceImpl;


import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.team.shoppingMall_119.AppConfi;
import com.team.shoppingMall_119.dao.Cat1Repository;
import com.team.shoppingMall_119.dao.Cat2Repository;
import com.team.shoppingMall_119.dao.GoodCatRepository;
import com.team.shoppingMall_119.dao.GoodRepository;
import com.team.shoppingMall_119.entity.Good;
import com.team.shoppingMall_119.entity.GoodCat;
import com.team.shoppingMall_119.service.GoodService;

@Service
@Transactional
public class GoodServiceImpl implements GoodService {
	@Autowired
	private GoodRepository goodR;
	@Autowired
	private GoodCatRepository goodCatR;
	@Autowired
	private Cat1Repository cat1R;
	@Autowired
	private Cat2Repository cat2R;
	
    @Override
    public JSONObject searchByCat1Id(Integer cat1_id) {
        // TODO Auto-generated method stub
    	// 根据以及分类的id搜索商品
        List<GoodCat> goodCatList = goodCatR.findByCatOneId(cat1_id);
        List<Integer> goodIdList = new ArrayList();
        for(int i = 0 ; i < goodCatList.size();i++){
            goodIdList.add(goodCatList.get(i).getGoodId());
        }
        // 得到good列表
        List<Good> goodList = new ArrayList();
        for(int i = 0; i < goodIdList.size();i++){
            goodList.add(goodR.findByGoodId(goodIdList.get(i)));
        }
        JSONObject res = new JSONObject(true);
        JSONArray ja = getJSON(goodList);
        res.put("message", ja);
        res.put("meta", AppConfi.getMeta());
        return res;
    }

    @Override
    public JSONObject searchByCat2Id(Integer cat2_id) {
        // TODO Auto-generated method stub
        // 根据二级分类的id搜索商品
        List<GoodCat> goodCatList = goodCatR.findByCatTwoId(cat2_id);
        List<Integer> goodIdList = new ArrayList<Integer>();
        for(int i = 0;i < goodCatList.size();i++){
            goodIdList.add(goodCatList.get(i).getGoodId());
        }
        
        List<Good> goodList = new ArrayList<Good>();
        for(int i = 0; i < goodIdList.size();i++){
            goodList.add(goodR.findByGoodId(goodIdList.get(i)));
        }
        JSONObject res = new JSONObject(true);
        JSONArray ja = getJSON(goodList);
        res.put("message", ja);
        res.put("meta", AppConfi.getMeta());
        return res;
    }

    private JSONArray getJSON(List<Good> goodList){
        JSONArray ja = new JSONArray();
    	for(int i = 0; i < goodList.size();i++) {
    		Good tempGood = goodList.get(i);
    		JSONObject tempObject = new JSONObject(true);
    		tempObject.put("good_id", tempGood.getGoodId());
    		tempObject.put("good_name", tempGood.getGoodName());
    		tempObject.put("good_price", tempGood.getGoodPrice());
    		tempObject.put("image_src", AppConfi.getSrcArray(tempGood.getGoodPics())[0]);
    		if(!tempObject.isEmpty()) {
    			ja.add(tempObject);
    		}
    	}
        return ja;
    }

    @Override
    public JSONObject searchByGoodName(String good_name) {
        // TODO Auto-generated method stub
        // 根据商品名字搜索出相应的商品
    	List<Good>goodList = goodR.findByGoodNameLike("%"+good_name+"%");
    	JSONObject res = new JSONObject(true);
    	JSONArray ja = getJSON(goodList);
    	res.put("message", ja);
    	JSONObject meta = AppConfi.getMeta();
    	res.put("meta", meta);
        return res;
    }

    @Override
    public JSONObject searchByIsDiscut() {
    	List<Good> goodList = goodR.findAll();
    	List<Good> goodDisCutList = new ArrayList<Good>();
    	for(int i = 0; i < goodList.size();i++) {
    		Integer tempDiscut = goodList.get(i).getGoodIsDiscut();
    		if(tempDiscut < 10) {
    			goodDisCutList.add(goodList.get(i));
    		}
    	}
    	JSONObject ms = new JSONObject();
    	ms.put("message", getJSON(goodDisCutList));
    	ms.put("meta", AppConfi.getMeta());
        return ms;
    }

    @Override
    public JSONObject searchByIsGroupBuy() {
        // TODO Auto-generated method stub
    	List<Good> goodList = goodR.findByGoodIsGroupBuy(1);
    	JSONObject res = new JSONObject(true);
    	JSONArray ja = getJSON(goodList);
    	res.put("message", ja);
    	JSONObject meta = AppConfi.getMeta();
    	res.put("meta", meta);
        return res;
    }

    @Override
    public JSONObject searchByIsNew(){
        // TODO Auto-generated method stub
    	List<Good> goodList = goodR.findAll();
    	List<String> strList = new ArrayList<String>();
    	for(int i = 0;i < goodList.size();i++) {
    		Timestamp ts = goodList.get(i).getGoodAddTime();
    		strList.add(ts.toString());
    	}
    	
    	List<Good> goodIsNew = new ArrayList<Good>();
    	Date now = new Date(); 
    	//设置时间格式
    	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	String nowTime = dateFormat.format(now);
    	try {
    		Date nowDate = dateFormat.parse(nowTime);
	    	for(int i = 0; i < goodList.size();i++) {
	    		String beforTime = strList.get(i);
	    		Date beforDate = dateFormat.parse(beforTime);
	    		if(((nowDate.getTime() - beforDate.getTime()) / (60 * 60 * 1000)) % 24 <= 48) {
	    			goodIsNew.add(goodList.get(i));
	    		}
	    	}
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    	
    	
    	JSONObject ms = new JSONObject();
    	ms.put("message", getJSON(goodIsNew));
    	ms.put("meta", AppConfi.getMeta());
    	
        return ms;
    }

	@Override
	public JSONObject getDetailById(Integer good_id) {
		// TODO Auto-generated method stub
		Good good = goodR.findByGoodId(good_id);
		JSONObject end = new JSONObject(true);
		
		GoodCat tempGoodCatR = goodCatR.findByGoodId(good_id);
		
		// 创建 message JSON 对象		
		JSONObject message = new JSONObject(true);
		message.put("good_id", good.getGoodId());
		message.put("good_name", good.getGoodName());
		message.put("good_price", good.getGoodPrice());
		message.put("good_number", good.getGoodReserve());
		message.put("good_introduce", good.getGoodIntroduce());
		message.put("cat1_id", tempGoodCatR.getCatOneId());
		message.put("cat2_id", tempGoodCatR.getCatTwoId());
		message.put("is_discut", good.getGoodIsDiscut());
		message.put("is_groupbuy", good.getGoodIsGroupBuy());
		String picsa[] =good.getGoodPics().split(",");

		JSONArray pics = new JSONArray();
		for (int i = 0; i < picsa.length/* 图片个数 */ ; i++) {
			JSONObject tmd = new JSONObject(true);
			tmd.put("image_src",AppConfi.URL+ picsa[i]);
			pics.add(tmd);
		}
		message.put("pics", pics);
		end.put("message", message);
		end.put("meta", AppConfi.getMeta());
		return end;
	}
    
}
