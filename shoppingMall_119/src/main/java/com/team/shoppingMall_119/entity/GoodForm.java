package com.team.shoppingMall_119.entity;

import java.io.Serializable;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "good_form")
public class GoodForm implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name = "formId")
	private Integer formId;
	
	@Column(name = "goodId")
	private String goodId;
	
	@Column(name = "goodNumber")
	private String goodNumber;

	public GoodForm() {
		
	}
	public GoodForm(Integer formId, String goodId, String goodNumber) {
		this.formId = formId;
		this.goodId = goodId;
		this.goodNumber = goodNumber;
	}
	public Integer getFormId() {
		return formId;
	}
	public void setFormId(Integer formId) {
		this.formId = formId;
	}
	public String getGoodId() {
		return goodId;
	}
	public void setGoodId(String goodId) {
		this.goodId = goodId;
	}
	public String getGoodNumber() {
		return goodNumber;
	}
	public void setGoodNumber(String goodNumber) {
		this.goodNumber = goodNumber;
	}
	
}
