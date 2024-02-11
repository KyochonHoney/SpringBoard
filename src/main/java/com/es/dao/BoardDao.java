package com.es.dao;

import java.util.ArrayList;

import com.es.dto.BoardDto;

public interface BoardDao {
	//�Խñ� �� ��������
	ArrayList<BoardDto> getAllList(int pageNum);
	//������ ������ �� ��������
	int getLastPageNum();
	//BNO���� �Խ��� �� ��������
	BoardDto getBoardDtoByBno(int bno);
	//��ȸ�� �ø���
	void increaseHitcount(int bno);
	//�Խñ� ����
	void write(BoardDto dto);
	//�� �����ϱ�
	void ModifyByBno(int bno, String title, String content);
	//�Խñ� �����ϱ�
	void deletePost(int bno);
/*
	//��۴ޱ�
	//ArrayList<ReplyDto> getReplyListByBno(int bno);
*/
}
