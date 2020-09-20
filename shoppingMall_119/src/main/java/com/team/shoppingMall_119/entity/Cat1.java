package com.team.shoppingMall_119.entity;

import java.io.Serializable;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


//一级分类对应的类
@Entity
@Table(name = "cat1")

public class Cat1 implements  Serializable{
    private static final long serialVersionUID = 1L;
	
    @Id
    @Column(name = "catOneId")
    private Integer cat1Id;

    @Column(name = "catOneName")
    private String cat1Name;

    public Integer getCat1Id() {
        return cat1Id;
    }

    public void setCat1Id(Integer cat1Id) {
        this.cat1Id = cat1Id;
    }

    public String getCat1Name() {
        return cat1Name;
    }

    public void setCat1Name(String cat1Name) {
        this.cat1Name = cat1Name;
    }
}
