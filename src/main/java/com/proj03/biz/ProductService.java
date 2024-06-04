package com.proj03.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.proj03.dao.ProductMapper;
import com.proj03.dto.Product;
import com.proj03.dto.ProductVO;
@Service
public class ProductService implements ProductBiz {

	@Autowired
	private ProductMapper productDAO;
	
	@Override
	public int getTotalCount() {
		return productDAO.getTotalCount();
	}

	@Override
	public List<ProductVO> getProductList() {
		return productDAO.getProductList();
	}

	@Override
	public List<ProductVO> getProductCateList(String cate) {
		return productDAO.getProductCateList(cate);
	}

	@Override
	public ProductVO getProduct(int pno) {
		return productDAO.getProduct(pno);
	}

	@Override
	public void insProduct(Product product) {
		productDAO.insProduct(product);
	}

	@Override
	public void upProduct(Product product) {
		productDAO.upProduct(product);		
	}

	@Override
	public void delProduct(int pno) {
		productDAO.delProduct(pno);		
	}

}