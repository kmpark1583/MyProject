package com.board.dao;

import java.util.List;

import com.board.domain.BoardVO;
import com.board.domain.MemberVO;

public interface BoardDAO {
 
 // 게시물 목록
 public List list() throws Exception; 

 // 게시물 작성용 메서드
 public void writer(BoardVO vo) throws Exception;
 
 // 게시물 조회용 메서드
 public BoardVO view(int bno) throws Exception;
 
 // 게시물 수정
 public void modify(BoardVO vo) throws Exception;
 
 public void delete(int bno) throws Exception;
 
//게시물 총 갯수
public int count() throws Exception;
 
//게시물 목록 + 페이징
public List listPage(int displayPost, int postNum) throws Exception;


}