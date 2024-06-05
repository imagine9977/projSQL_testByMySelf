package com.proj03.dao;

import java.util.List;

import com.proj03.dto.Qna;

public interface QnaMapper {

	public List<Qna> getCatQnaList(String cat);
	public List<Qna> getQnaList();
	public Qna getQna(int qno);
	public int insQues(Qna qna);
	public int insAnsw(Qna qna);
	public int editProQna(Qna qna);
	public int delQues(int qno);
	public int delAnsw(int qno);
	public void hitCount(int qno);
}
