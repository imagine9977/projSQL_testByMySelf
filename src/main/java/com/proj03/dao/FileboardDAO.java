package com.proj03.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.proj03.dto.Fileboard;
import com.proj03.util.PagingBean;

@Repository
public class FileboardDAO implements FileboardMapper {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int getTotalCount() {
		return sqlSession.selectOne("fileboard.getTotalCount");
	}

	@Override
	public List<Fileboard> getFileboardListAll() {
		return sqlSession.selectList("fileboard.getFileboardListAll");
	}
	
	@Override
	public List<Fileboard> getFileboardList(PagingBean pagingBean) {
		return sqlSession.selectList("fileboard.getFileboardList", pagingBean);
	}

	@Override
	public Fileboard getFileboard(int no) {
		return sqlSession.selectOne("fileboard.getFileboard", no);
	}

	@Override
	public void insFileboard(Fileboard board) {
		sqlSession.insert("fileboard.insFileboard", board);
	}

	@Override
	public void upFileboard(Fileboard board) {
		sqlSession.update("fileboard.upFileboard", board);
		
	}

	@Override
	public void hitCount(int no) {
		sqlSession.update("fileboard.hitCount", no);
	}

	@Override
	public void delFileboard(int no) {
		sqlSession.delete("fileboard.delFileboard", no);
	}
	
}