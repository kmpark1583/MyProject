package com.board.dao;

import com.board.domain.MemberVO;

public interface MemberDAO {
	
	// 회원가입
	public void register(MemberVO vo) throws Exception;
	
	public MemberVO login(MemberVO vo) throws Exception;
	
	public void modify(MemberVO vo) throws Exception;
	
	public void deleteuser(MemberVO vo) throws Exception;
	
	public MemberVO idCheck(String userId) throws Exception;

}
