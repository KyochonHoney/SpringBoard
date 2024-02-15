package com.es.service;

import java.util.ArrayList;
import java.util.List;

import com.es.dto.BoardDto;
import com.es.dto.MemberDto;

public interface BoardService {
	ArrayList<BoardDto> getBoardListByPageNumber(int pageNumber);
	int getLastPageNum();
	BoardDto getBoardDtoByBno(int bno);
	void increaseHitcount(int bno);
	void writePost(BoardDto dto);
	void modifyPost(int bno, String title, String content);
	void deletePost(int bno);
	boolean checkPw(String id, String pw);
	MemberDto getMemberList(String id);
	void joinMember(String id, String pw, String name, String email);
	List<BoardDto> getNextList(int page);
	boolean checkId(String id);
}