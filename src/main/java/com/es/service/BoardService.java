package com.es.service;

import java.util.ArrayList;

import com.es.dto.BoardDto;

public interface BoardService {
	ArrayList<BoardDto> getBoardListByPageNumber(int pageNumber);
	int getLastPageNum();
	BoardDto getBoardDtoByBno(int bno);
	void increaseHitcount(int bno);
	void writePost(BoardDto dto);
	void modifyPost(int bno, String title, String content);
	void deletePost(int bno);
}
