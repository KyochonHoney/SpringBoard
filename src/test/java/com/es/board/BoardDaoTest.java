package com.es.board;

import java.util.ArrayList;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.es.dao.BoardDaoImpl;
import com.es.dto.BoardDto;
import com.es.dto.MemberDto;

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
	   dao.increaseHitCount(1);
   }
   
   @Test
   public void testwritePost() throws Exception{
	   dao.write(new BoardDto(0, "������", "����° �����", "�׽�Ʈ", 0, null));
   }
   
   @Test
   public void testModifyPost() throws Exception{
	   dao.modifyByBno(6, "test", "test");
   }
   
   @Test
   public void testDeletePost() throws Exception{
	   dao.deletePost(2);
   }
   
   @Test
   public void testCheckLogin() throws Exception{
	   System.out.println(dao.checkLogin("joms0308", "leefaith99"));
   }
   
   @Test
   public void testCheckMemberList() throws Exception{
	   MemberDto dto = dao.selectMemberInfo("joms0308");
	   System.out.println(dto.getName() + " / " + dto.getId() );
   }
   
   @Test
   public void testJoinMember() throws Exception{
	   dao.joinMember("asd", "asd", "인생", "asd@naver.com");
   }
}