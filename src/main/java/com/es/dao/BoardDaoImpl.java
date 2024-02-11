package com.es.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.es.dto.BoardDto;

@Repository
public class BoardDaoImpl implements BoardDao {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public ArrayList<BoardDto> getAllList(int pageNum){
		ArrayList<BoardDto> listBoard = new ArrayList<BoardDto>();
		int endRnum = pageNum * 20;
		int startRnum = endRnum - 19;
		HashMap<String,Integer> hmap = new HashMap<String,Integer>();
		hmap.put("startRnum", startRnum);
		hmap.put("endRnum", endRnum);
		sqlSession.selectList("BoardMapper.selectAll", hmap);
		List<BoardDto> list1 = sqlSession.selectList("BoardMapper.selectAll",hmap);
		listBoard.addAll(list1);
		
		return listBoard;
	}
	
	@Override
	public int getLastPageNum() {
		int cnt = sqlSession.selectOne("BoardMapper.selectLastPage");
		return (cnt % 20 == 0) ?  cnt / 20 : cnt / 20 + 1;	
	}
	
	@Override
	public BoardDto getBoardDtoByBno(int bno) {
		return sqlSession.selectOne("BoardMapper.selectBoardDetail", bno);
	}
	
	@Override
	public void increaseHitcount(int bno) {
		sqlSession.update("BoardMapper.increaseHitcount",bno);
	}
	
	@Override
	public void write(BoardDto dto1) {
		BoardDto dto = new BoardDto(0, dto1.getWriter(), dto1.getTitle(), dto1.getContent(), 0, null);
		sqlSession.insert("BoardMapper.writePost", dto);
	}
	
	@Override
	public void ModifyByBno(int bno, String title, String content) {
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("bno", bno);
		hmap.put("title", title);
		hmap.put("content", content);
		sqlSession.update("BoardMapper.modifyPost", hmap);
	}
	
	@Override
	public void deletePost(int bno) {
		sqlSession.delete("BoardMapper.deletePost", bno);
	}
}
