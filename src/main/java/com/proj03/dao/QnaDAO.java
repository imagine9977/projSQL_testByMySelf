package com.proj03.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.proj03.dto.Qna;

@Repository
public class QnaDAO implements QnaMapper {
 
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<Qna> getQnaList() {
		return sqlSession.selectList("Qna.getQnaList");
	}

	@Override
	public Qna getQna(int no) {
		return sqlSession.selectOne("Qna.getQna", no);
	}

	@Override
	public int insQues(Qna qna) {
		return sqlSession.insert("Qna.insQues", qna);
	}

	@Override
	public int insAnsw(Qna qna) {
		return sqlSession.insert("Qna.insAnsw", qna);
	}

	@Override
	public int editProQna(Qna qna) {
		return sqlSession.update("Qna.editProQna", qna);
	}

	@Override
	public int delQues(int no) {
		return sqlSession.delete("Qna.delQues", no);
	}

	@Override
	public int delAnsw(int no) {
		return sqlSession.delete("Qna.delAnsw", no);
	}



	@Override
	public List<Qna> getCatQnaList(String cat) {
		// TODO Auto-generated method stub
		if(cat=="ALL"|| cat == "all") {
			return sqlSession.selectList("Qna.getQnaList");
		}
		return sqlSession.selectList("Qna.getCatQnaList",cat);
	}



}