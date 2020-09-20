package com.team.shoppingMall_119.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.team.shoppingMall_119.entity.GoodForm;

public interface GoodFormRepository extends JpaRepository<GoodForm,Integer>{
	public GoodForm findByFormId(Integer formId);
}
