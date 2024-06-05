package com.proj03.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.proj03.dao.QnaMapper;
import com.proj03.dto.Qna;

@Service
public class QnaService implements QnaBiz {

	@Autowired
	private QnaMapper qnaDAO;

	@Override
	public List<Qna> getQnaList() {
		// TODO Auto-generated method stub
		return qnaDAO.getQnaList();
	}

	@Override
	public Qna getQna(int qno) {
		// TODO Auto-generated method stub
		qnaDAO.hitCount(qno);
		return qnaDAO.getQna(qno);
	}

	@Override
	public int insQues(Qna qna) {
		return qnaDAO.insQues(qna);
		// TODO Auto-generated method stub

	}

	@Override
	public int insAnsw(Qna qna) {
		// TODO Auto-generated method stub
		return qnaDAO.insAnsw(qna);
	}


	@Override
	public int editProQna(Qna qna) {
		// TODO Auto-generated method stub
		return qnaDAO.editProQna(qna);
	}

	@Override
	public int delQues(int qno) {
		// TODO Auto-generated method stub
		return qnaDAO.delQues(qno);
	}

	@Override
	public int delAnsw(int qno) {
		// TODO Auto-generated method stub
		return qnaDAO.delAnsw(qno);
	}

	@Override
	public List<Qna> getCateQnaList(String cat) {
		// TODO Auto-generated method stub
		return qnaDAO.getCatQnaList(cat);
	}

	

}