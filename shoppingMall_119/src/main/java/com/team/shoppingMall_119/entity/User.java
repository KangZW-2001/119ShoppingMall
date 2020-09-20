package com.team.shoppingMall_119.entity;

import java.io.Serializable;
import javax.persistence.*;

@Entity
@Table(name = "user")
public class User implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name = "userId")
	private Integer userId;
	
	@Column(name = "userName")
	private String userName;
	
	@Column(name = "userMoney")
	private Integer userMoney;
	
	
	public Integer getUserMoney() {
		return userMoney;
	}

	public void setUserMoney(Integer userMoney) {
		this.userMoney = userMoney;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

		public User() {
		super();
	}
	
	public User(Integer userId, String userName) {
		super();
		this.userName = userName;
	}
	
	
}
