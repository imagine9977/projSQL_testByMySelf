package com.proj03.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.proj03.dto.Basket;

@Repository
public class BasketDAO implements BasketMapper {

	@Autowired
	private SqlSession sqlSession;
	
	
	@Override
	public List<Basket> getBasketList() {
		return sqlSession.selectList("Basket.getBasketList");
	}

	@Override
	public Basket getBasket(int bno) {
		return sqlSession.selectOne("Basket.getBasket", bno);
	}

	

	@Override
	public void insBasket(Basket basket) {
		sqlSession.insert("Basket.insBasket", basket);
	}

	@Override
	public void upBasket(Basket basket) {
		sqlSession.update("Basket.upBasket", basket);
	}

	@Override
	public void delBasket(int bno) {
		sqlSession.delete("Basket.delBasket", bno);		
	}


	
	@Override
	public int getTotalCount() {
		return sqlSession.selectOne("Basket.getTotalCount");

	}

	@Override
	public void vcntCount(int bno) {
		sqlSession.update("Basket.vcntCount", bno);
		
	}


}