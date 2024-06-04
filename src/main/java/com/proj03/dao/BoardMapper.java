   package com.proj03.dao;

import java.util.List;

import com.proj03.dto.Board;

public interface BoardMapper {
	public int getTotalCount();
	public List<Board> getBoardList();
	public Board getBoard(int bno);
	public void insBoard(Board board);
	public void upBoard(Board board);
	public void delBoard(int bno);
	public void vcntCount(int bno);
}