package com.team.shoppingMall_119.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

import com.team.shoppingMall_119.entity.GoodCat;

public interface GoodCatRepository extends JpaRepository<GoodCat,Integer>{

    public List<GoodCat> findByCatOneId(Integer catOneId);

    public List<GoodCat> findByCatTwoId(Integer catTwoId);
    
    public GoodCat findByGoodId(Integer goodId);

}
