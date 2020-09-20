package com.team.shoppingMall_119.entity;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "good")
public class Good implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name = "goodId")
	private Integer goodId;
	
	@Column(name = "goodName")
	private String goodName;
	
	@Column(name = "goodPrice")
	private Integer goodPrice;
	
	@Column(name = "goodReserve")
	private Integer goodReserve;
	
	@Column(name = "goodComment")
	private String goodComment;
	
	@Column(name = "goodIntroduce")
	private String goodIntroduce;
	
	@Column(name = "goodAddTime")
	private Timestamp goodAddTime;
	
	public int getGoodIsGroupBuy() {
		return goodIsGroupBuy;
	}


	public void setGoodIsGroupBuy(int goodIsGroupBuy) {
		this.goodIsGroupBuy = goodIsGroupBuy;
	}

	@Column(name = "goodIsDiscut")
	private int goodIsDiscut;
	
	@Column(name = "goodIsGroupBuy")
	private int goodIsGroupBuy;
	
	@Column(name = "goodPics")
	private String goodPics;
	
	public Good() {
		super();
	}
	
	
	public Good(String goodName, Integer goodPrice,Integer goodReserve,
				 String goodIntroduce, String goodIcon, 
				 Timestamp goodAddTime, Integer goodIsDiscut, int goodIsGroupBuy
				 ,String goodPics) {
		super();
		this.goodName = goodName;
		this.goodPrice = goodPrice;
		this.goodReserve = goodReserve;
		this.goodAddTime = goodAddTime;
		this.goodIntroduce = goodIntroduce;
		this.goodIsDiscut = goodIsDiscut;
		this.goodIsGroupBuy = goodIsGroupBuy;
		this.goodPics = goodPics;
	}

	public int getGoodIsDiscut() {
		return goodIsDiscut;
	}

	public void setGoodIsDiscut(int goodIsDiscut) {
		this.goodIsDiscut = goodIsDiscut;
	}

	public int isGoodIsGroupBy() {
		return goodIsGroupBuy;
	}

	public void setGoodIsGroupBy(int goodIsGroupBuy) {
		this.goodIsGroupBuy = goodIsGroupBuy;
	}

	public String getGoodPics() {
		return goodPics;
	}

	public void setGoodPics(String goodPics) {
		this.goodPics = goodPics;
	}
	
	public Integer getGoodId() {
		return goodId;
	}

	public void setGoodId(Integer goodId) {
		this.goodId = goodId;
	}

	public String getGoodName() {
		return goodName;
	}

	public void setGoodName(String goodName) {
		this.goodName = goodName;
	}

	public Integer getGoodPrice() {
		return goodPrice;
	}

	public void setGoodPrice(Integer goodPrice) {
		this.goodPrice = goodPrice;
	}

	public Integer getGoodReserve() {
		return goodReserve;
	}

	public void setGoodReserve(Integer goodReserve) {
		this.goodReserve = goodReserve;
	}

	public String getGoodComment() {
		return goodComment;
	}

	public void setGoodComment(String goodComment) {
		this.goodComment = goodComment;
	}

	public String getGoodIntroduce() {
		return goodIntroduce;
	}

	public void setGoodIntroduce(String goodIntroduce) {
		this.goodIntroduce = goodIntroduce;
	}


	public Timestamp getGoodAddTime() {
		return goodAddTime;
	}

	public void setGoodAddTime(Timestamp goodAddTime) {
		this.goodAddTime = goodAddTime;
	}

	
}
