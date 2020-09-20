package com.team.shoppingMall_119.entity;

import java.io.Serializable;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;



@Entity
@Table(name = "cat2")

public class Cat2 implements  Serializable{
    private static final long serialVersionUID = 1L;
	
    @Id
    @Column(name = "catTwoId")
    private Integer cat2Id;

    @Column(name = "catTwoName")
    private String cat2Name;
    
    public String getCatImageSrc() {
		return catImageSrc;
	}

	public void setCatImageSrc(String catImageSrc) {
		this.catImageSrc = catImageSrc;
	}

	@Column(name = "catImageSrc")
    private String catImageSrc;

    public Integer getCat2Id() {
        return cat2Id;
    }

    public void setCat2Id(Integer cat2Id) {
        this.cat2Id = cat2Id;
    }

    public String getCat2Name() {
        return cat2Name;
    }

    public void setCat2Name(String cat2Name) {
        this.cat2Name = cat2Name;
    }

   
}
