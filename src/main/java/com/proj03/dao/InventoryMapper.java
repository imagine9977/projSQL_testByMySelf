package com.proj03.dao;

import java.util.List;

import com.proj03.dto.CategoryVO;
import com.proj03.dto.Inventory;

public interface InventoryMapper {
	int getTotalCount();
	List<Inventory> getInventoryList();
	List<CategoryVO> categoryLoading(String cate);
	Inventory getInventory(int pno);
	void insInventory(Inventory inventory);
	void upInventory(Inventory inventory);
	void delInventory(int ino);
}