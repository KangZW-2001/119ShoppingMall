package com.team.shoppingMall_119.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.team.shoppingMall_119.entity.Good;

public interface GoodRepository extends JpaRepository<Good,Integer>{
	/*
	 * 
	 * 1.根据id获得所有的商品信息
	 * 2.根据good_name获得 大体的 good的id，然后获得所有的商品信息
	 * 
	 * */
	public Good findByGoodId(Integer goodId);
	public List<Good> findByGoodNameLike(String goodName);
	public List<Good> findByGoodIsGroupBuy(Integer isGroupBuy);
	
}
