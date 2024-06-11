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
	public Qna getQna(int qno) {
		return sqlSession.selectOne("Qna.getQna", qno);
	}

	@Override
	public int insQues(Qna qna) {
		int x= sqlSession.insert("Qna.insQues", qna);
		return sqlSession.update("Qna.upParno", qna);
	}

	@Override
	public int insAnsw(Qna qna) {
		int x= sqlSession.insert("Qna.insAnsw", qna);
		return sqlSession.update("Qna.updateReply", qna);
	}

	@Override
	public int editProQna(Qna qna) {
		//int qparno = qna.getQparno();
		int x=  sqlSession.update("Qna.editProQna", qna);
		return sqlSession.update("Qna.updateReply", qna);
	}

	@Override
	public int delQues(int qno) {
		return sqlSession.delete("Qna.delQna", qno);
	}

	@Override
	public int delAnsw(int qno) {
		return sqlSession.delete("Qna.delAns", qno);
	}



	@Override
	public List<Qna> getCatQnaList(String cat) {
		// TODO Auto-generated method stub
		if(cat=="ALL"|| cat == "all") {
			return sqlSession.selectList("Qna.getQnaList");
		}
		return sqlSession.selectList("Qna.getCatQnaList",cat);
	}

	@Override
	public void hitCount(int qno) {
		// TODO Auto-generated method stub
		sqlSession.delete("Qna.hitCount", qno);
	}



}