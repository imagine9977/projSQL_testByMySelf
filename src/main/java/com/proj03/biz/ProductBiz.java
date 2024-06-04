package com.proj03.biz;

import java.util.List;

import com.proj03.dto.Product;
import com.proj03.dto.ProductVO;


public interface ProductBiz {
	int getTotalCount();
	List<ProductVO> getProductList();
	List<ProductVO> getProductCateList(String cate);
	ProductVO getProduct(int pno);
	void insProduct(Product product);
	void upProduct(Product product);
	void delProduct(int pno);
}
