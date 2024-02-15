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
import com.es.service.BoardService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class BoardServiceTest {
   @Autowired
   BoardService svc;
   
   @Test
   public void testGetAllList() throws Exception{
	   ArrayList<BoardDto> list1 = svc.getBoardListByPageNumber(1);
	   for(BoardDto dto : list1) {
		   System.out.println(dto.getBno()+"/");
	   }
   }
   
   @Test
   public void testGetBoardDetail() throws Exception {
	   int bno = 1;
	   BoardDto dto = svc.getBoardDtoByBno(bno);
	   System.out.println(dto.getBno()+"/" + dto.getContent());
   }
   
   @Test
   public void testWritePost() throws Exception {
	   svc.writePost(new BoardDto(0, "test", "test", "test", 0, null));
   }
   
   @Test
   public void testModifyPost() throws Exception{
	   svc.modifyPost(5, "test", "占쏙옙占쏙옙占싹깍옙");
   }
   
   @Test
   public void testDeletePost() throws Exception{
	   svc.deletePost(3);
   }
   
   @Test
   public void testGetMemberList() throws Exception{
	   MemberDto dto = svc.getMemberList("joms0308");
	   System.out.println(dto.getName() + " / " + dto.getId() );
   }
   
   @Test
   public void testJoinMember() throws Exception{
	   svc.joinMember("aa", "aa", "�뿬�깮", "aa@naver.com");
   }
   
   @Test
   public void testCheckId() throws Exception{
	   System.out.println(svc.checkId("joms0308"));
   }
}