package com.es.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.es.dao.BoardDao;
import com.es.dto.BoardDto;
import com.es.dto.MemberDto;

@Service
public class BoardServiceImpl implements BoardService{
	@Autowired
	BoardDao bDao;
	
	@Override
	public ArrayList<BoardDto> getBoardListByPageNumber(int page){
		return bDao.getAllList(page);	
	}
	
	@Override
	public int getLastPageNum() {
		return bDao.getLastPageNum();
	}

	@Override
	public BoardDto getBoardDtoByBno(int bno) {
		return bDao.getBoardDtoByBno(bno);
	}

	@Override
	public void increaseHitcount(int bno) {
		bDao.increaseHitCount(bno);
	}

	@Override
	public void writePost(BoardDto dto) {
		bDao.write(dto);
	}

	@Override
	public void modifyPost(int bno, String title, String content) {
		bDao.modifyByBno(bno, title, content);
	}

	@Override
	public void deletePost(int bno) {
		bDao.deletePost(bno);
	}

	@Override
	public boolean checkPw(String id, String pw) {
		return bDao.checkLogin(id, pw);
	}
	
	@Override
	public MemberDto getMemberList(String id) {
		return bDao.selectMemberInfo(id);
	}

	@Override
	public void joinMember(String id, String pw, String name, String email) {
		bDao.joinMember(id, pw, name, email);
	}
	
	@Override
	public ArrayList<BoardDto> getNextList(int page) {
	    return bDao.getAllList(page);
	}

	@Override
	public boolean checkId(String id) {
		return bDao.checkId(id);
	}
	
	
}
