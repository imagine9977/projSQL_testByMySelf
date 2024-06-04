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
public class Qna {
	private int qno;
	private int qlevel;
	private int qparno;
	private String qtitle;
	private String qcontent;
	private String qresdate;
	private int qhits;
	private Member member;
	private boolean secret;
	private String cate;
}
