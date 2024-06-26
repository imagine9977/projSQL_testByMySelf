package com.proj03.biz;

import java.util.List;

import com.proj03.dto.Qna;

public interface QnaBiz {

	public List<Qna> getCateQnaList(String cat);
	public List<Qna> getQnaList();
	public Qna getQna(int qno);
	public int insQues(Qna qna);
	public int insAnsw(Qna qna);
	public int editProQna(Qna qna);
	public int delQues(int qno);
	public int delAnsw(int qno);

}
