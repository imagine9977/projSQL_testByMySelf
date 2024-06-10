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
	private String qaid; 
	private String qname; 
	private boolean secret;
	private String cate;
	private Member member;
	
	public int getQno() {
		return qno;
	}
	public void setQno(int qno) {
		this.qno = qno;
	}
	public int getQlevel() {
		return qlevel;
	}
	public void setQlevel(int qlevel) {
		this.qlevel = qlevel;
	}
	public int getQparno() {
		return qparno;
	}
	public void setQparno(int qparno) {
		this.qparno = qparno;
	}
	public String getQtitle() {
		return qtitle;
	}
	public void setQtitle(String qtitle) {
		this.qtitle = qtitle;
	}
	public String getQcontent() {
		return qcontent;
	}
	public void setQcontent(String qcontent) {
		this.qcontent = qcontent;
	}
	public String getQresdate() {
		return qresdate;
	}
	public void setQresdate(String qresdate) {
		this.qresdate = qresdate;
	}
	public int getQhits() {
		return qhits;
	}
	public void setQhits(int qhits) {
		this.qhits = qhits;
	}
	public String getQaid() {
		return qaid;
	}
	public void setQaid(String qaid) {
		this.qaid = qaid;
	}
	public String getQname() {
		return qname;
	}
	public void setQname(String qname) {
		this.qname = qname;
	}
	public boolean isSecret() {
		return secret;
	}
	public void setSecret(boolean secret) {
		this.secret = secret;
	}
	public String getCate() {
		return cate;
	}
	public void setCate(String cate) {
		this.cate = cate;
	}
	public Member getMember() {
		return member;
	}
	public void setMember(Member member) {
		this.member = member;
	}
	
}
