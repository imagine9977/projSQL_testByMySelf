package com.proj03.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.proj03.dao.FreeMapper;
import com.proj03.dto.Free;

@Service
public class FreeService implements FreeBiz {

	@Autowired
	private FreeMapper freeDAO;
		
	
	@Override
	public int getTotalCount() {
		return freeDAO.getTotalCount();
	}

	@Override
	public List<Free> getFreeList() {
		return freeDAO.getFreeList();
	}

	@Override
	@Transactional
	public Free getFree(int no) {
		freeDAO.hitCount(no);
		return freeDAO.getFree(no);
	}

	@Override
	public Free getNoCountFree(int no) {
		return freeDAO.getFree(no);
	}

	@Override
	public void insFree(Free free) {
		freeDAO.insFree(free);		
	}

	@Override
	public void upFree(Free free) {
		freeDAO.upFree(free);		
	}

	@Override
	public void hitCount(int no) {
		freeDAO.hitCount(no);		
	}

	@Override
	public void delFree(int no) {
		freeDAO.delFree(no);		
	}

	
}