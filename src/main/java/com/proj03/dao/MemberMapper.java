package com.proj03.dao;

import java.util.List;

import com.proj03.dto.Member;

public interface MemberMapper {
	public int memberCount();
	public List<Member> getMemberList();
	public Member getMember(String id);
	public void insMember(Member member);
	public void changePw(Member member);
	public void changeInfo(Member member);
	public void changePoint(Member member);
	public void delMember(String id);
}
