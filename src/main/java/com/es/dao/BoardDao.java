package com.es.dao;

import java.util.ArrayList;

import com.es.dto.BoardDto;

public interface BoardDao {
	//게시글 다 가져오기
	ArrayList<BoardDto> getAllList(int pageNum);
	//마지막 페이지 값 가져오기
	int getLastPageNum();
	//BNO따른 게시판 글 가져오기
	BoardDto getBoardDtoByBno(int bno);
	//조회수 올리기
	void increaseHitcount(int bno);
	//게시글 쓰기
	void write(BoardDto dto);
	//글 수정하기
	void ModifyByBno(int bno, String title, String content);
	//게시글 삭제하기
	void deletePost(int bno);
/*
	//댓글달기
	//ArrayList<ReplyDto> getReplyListByBno(int bno);
*/
}
