package com.team.shoppingMall_119.entity;

import java.io.Serializable;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="user_form")
public class UserForm implements  Serializable{
	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name = "userId")
	private Integer userId;
	
	@Column(name = "formId")
	private Integer formId;
	
	public UserForm() {
		
	}
	public UserForm(Integer userId,Integer formId) {
		this.userId = userId;
		this.formId = formId;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public Integer getFormId() {
		return formId;
	}
	public void setFormId(Integer formId) {
		this.formId = formId;
	}
	
}
