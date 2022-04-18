package com.board.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.board.domain.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	// 마이바티스 연동
	@Inject
	private SqlSession sql;
	
	// 매퍼
	private static String namespace="com.board.mappers.memberMapper";
	
	@Override
	public void register(MemberVO vo) throws Exception {
		sql.insert(namespace + ".register", vo);
		
	}

	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		return sql.selectOne(namespace + ".login", vo);
	}

	@Override
	public void modify(MemberVO vo) throws Exception {
		sql.update(namespace + ".modify", vo);
		
	}

	@Override
	public void deleteuser(MemberVO vo) throws Exception {
		sql.delete(namespace +".deleteuser", vo);
		
	}

	@Override
	public MemberVO idCheck(String userId) throws Exception {
		return sql.selectOne(namespace + ".idCheck", userId);
	}
}
