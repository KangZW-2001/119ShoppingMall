package com.team.shoppingMall_119.entity;

import java.io.Serializable;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

//商品和分类的对应类

@Entity
@Table(name="good_cat")
public class GoodCat implements  Serializable{

    private static final long serialVersionUID = 1L;
    
    @Id
    @Column(name = "goodId")
    private Integer goodId;

    @Column(name = "catOneId")
    private Integer catOneId;

    public GoodCat() {
    	
    }
    
    public GoodCat(Integer goodId,Integer catOneId,Integer catTwoId) {
    	this.catOneId = catOneId;
    	this.catTwoId = catTwoId;
    	this.goodId = goodId;
    }
    
    public Integer getGoodId() {
		return goodId;
	}


	public void setGoodId(Integer goodId) {
		this.goodId = goodId;
	}


	
	public void setCatOneId(Integer catOneId) {
		this.catOneId = catOneId;
	}

	public void setCatTwoId(Integer catTwoId) {
		this.catTwoId = catTwoId;
	}


	@Column(name = "catTwoId")
    private Integer catTwoId;

	public Integer getCatOneId() {
		return catOneId;
	}

	public Integer getCatTwoId() {
		return catTwoId;
	}
    

    
    
    
    
    
    
    
    
    
    
}
