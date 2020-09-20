package com.team.shoppingMall_119.dao;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import com.team.shoppingMall_119.entity.Cat1;

public interface Cat1Repository extends JpaRepository<Cat1,Integer>{
	
	public List<Cat1> findAll();


}
