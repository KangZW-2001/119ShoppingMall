package com.team.shoppingMall_119.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.team.shoppingMall_119.entity.Cat2;

public interface Cat2Repository extends JpaRepository<Cat2,Integer>{

	public List<Cat2> findAll();
	
}
