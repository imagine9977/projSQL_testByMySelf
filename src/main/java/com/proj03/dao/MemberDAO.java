package com.proj03.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.proj03.dto.Member;

@Repository
public class MemberDAO implements MemberMapper {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<Member> getMemberList() {
		return sqlSession.selectList("member.getMemberList");
	}

	@Override
	public Member getMember(String id) {
		return sqlSession.selectOne("member.getMember", id);
	}

	@Override
	public int memberCount() {		
		return sqlSession.selectOne("member.memberCount");
	}

	@Override
	public void insMember(Member member) {
		sqlSession.insert("member.insMember", member);
	}

	@Override
	public void changePw(Member member) {
		sqlSession.update("member.changePw", member);	
	}

	@Override
	public void changeInfo(Member member) {
		sqlSession.update("member.changeInfo", member);
	}

	@Override
	public void changePoint(Member member) {
		sqlSession.update("member.changePoint", member);	
	}

	@Override
	public void delMember(String id) {
		sqlSession.delete("member.delMember", id);
	}
	
}