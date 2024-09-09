package com.won.wonpick.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.won.wonpick.member.model.vo.Member;

@Repository	
public class MemberDao {

	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.loginMember", m);
	}

	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}

	public int idCheck(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.selectOne("memberMapper.idCheck", id);
	}

	public String findId(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.findId", m);
	}

	public int changePwdUser(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.changePwdUser", m);
	}

	public int changePassword(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.changePassword", m);
	}
}
