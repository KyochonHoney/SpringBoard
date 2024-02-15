package com.es.dao;

import java.util.ArrayList;

import com.es.dto.BoardDto;
import com.es.dto.MemberDto;

public interface BoardDao {
	//�럹�씠吏��닔�뿉 留욊쾶 寃뚯떆湲� 媛��졇�삤湲�
	ArrayList<BoardDto> getAllList(int pageNum);
	//寃뚯떆湲� �닔�뿉 留욊쾶 留덉�留� �럹�씠吏��꽆踰� 媛뽮퀬�삤湲�
	int getLastPageNum();
	//BNO�뿉 �빐�떦�븯�뒗 寃뚯떆湲� �젙蹂� 媛��졇�삤湲�
	BoardDto getBoardDtoByBno(int bno);
	//議고쉶�닔 �뒛由ш린
	void increaseHitCount(int bno);
	//寃뚯떆湲� �벐湲�
	void write(BoardDto dto);
	//寃뚯떆湲� �닔�젙
	void modifyByBno(int bno, String title, String content);
	//寃뚯떆湲� �궘�젣
	void deletePost(int bno);
	//濡쒓렇�씤 �솗�씤.
	boolean checkLogin(String id, String pw);
	//硫ㅻ쾭�젙蹂� 媛��졇�삤湲�
	MemberDto selectMemberInfo(String id);
	//�쉶�썝媛��엯
	void joinMember(String id, String pw, String name, String email);
	//아이디 중복체크
	boolean checkId(String id);
	/*
	//占쏙옙榜檳占�
	//ArrayList<ReplyDto> getReplyListByBno(int bno);
*/
}
