package com.es.board;

import java.util.ArrayList;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.es.dao.BoardDaoImpl;
import com.es.dto.BoardDto;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class BoardDaoTest {
   @Autowired
   BoardDaoImpl dao;
   
   @Test
   public void testGetAllList() throws Exception{
	   ArrayList<BoardDto> list1 = dao.getAllList(1);
	   for(BoardDto dto : list1 ) {
		   System.out.println(dto.getBno() + "/");
	   }
   }
   
   @Test
   public void testSelectAll() throws Exception{
	   System.out.println("all: " + dao.getLastPageNum());
   }
   
   @Test
   public void testGetBoardDtoByBno() throws Exception{
	   System.out.println("dto: " + dao.getBoardDtoByBno(1));
   }
   
   @Test
   public void testIncreaseHitcount() throws Exception{
	   dao.increaseHitcount(1);
   }
   
   @Test
   public void testwritePost() throws Exception{
	   dao.write(new BoardDto(0, "신은서", "세번째 써봐요", "테스트", 0, null));
   }
   
   @Test
   public void testModifyPost() throws Exception{
	   dao.ModifyByBno(6, "test", "test");
   }
   
   @Test
   public void testDeletePost() throws Exception{
	   dao.deletePost(2);
   }
}