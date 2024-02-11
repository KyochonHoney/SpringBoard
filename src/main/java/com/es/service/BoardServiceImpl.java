package com.es.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.es.dao.BoardDao;
import com.es.dao.BoardDaoImpl;
import com.es.dto.BoardDto;

@Service
public class BoardServiceImpl implements BoardService{
	@Autowired
	BoardDaoImpl bDao;
	
	@Override
	public ArrayList<BoardDto> getBoardListByPageNumber(int page){
		return bDao.getAllList(page);	//한 페이지에 대한 게시글 가져오기
	}
	
	@Override
	public int getLastPageNum() {
		return bDao.getLastPageNum();	//마지막 페이지 수
	}

	@Override
	public BoardDto getBoardDtoByBno(int bno) {
		return bDao.getBoardDtoByBno(bno);
	}

	@Override
	public void increaseHitcount(int bno) {
		bDao.increaseHitcount(bno);
	}

	@Override
	public void writePost(BoardDto dto) {
		bDao.write(dto);
	}

	@Override
	public void modifyPost(int bno, String title, String content) {
		bDao.ModifyByBno(bno, title, content);
	}

	@Override
	public void deletePost(int bno) {
		bDao.deletePost(bno);
	}
	
}
