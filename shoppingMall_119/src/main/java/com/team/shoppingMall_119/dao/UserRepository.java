package com.team.shoppingMall_119.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import com.team.shoppingMall_119.entity.User;


public interface UserRepository extends JpaRepository<User,Integer>{
	
	public User findByUserName(String userName);
	
	public User findByUserId(Integer userId);
}
