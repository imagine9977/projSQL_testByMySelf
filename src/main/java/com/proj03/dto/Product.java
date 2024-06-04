package com.proj03.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Product {
	private int pno;
	private String cate;
	private String pname;
	private String com;
	private int price;
	private String img;
	private String img2;
	private String img3;
}
