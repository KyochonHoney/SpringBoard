package com.es.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.es.dto.BoardDto;
import com.es.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {
	@Autowired
	BoardService bService;
	
	@RequestMapping("/list")
	public String boardList(HttpServletRequest request) {
		int page = 1;
		try {
			page = Integer.parseInt(request.getParameter("page"));
		} catch(Exception e) { e.printStackTrace(); }
		ArrayList<BoardDto> listBoard = bService.getBoardListByPageNumber(page);
		int p = (page / 5) * 5 - (page % 5 == 0 ? 5 : 0);
		int lastPageNum = bService.getLastPageNum();
		int endPNum = p + 5;
		int startPNum = p + 1;
		
		request.setAttribute("page", page);
		request.setAttribute("startPNum", startPNum);
		request.setAttribute("endPNum", endPNum);
		request.setAttribute("lastPageNum", lastPageNum);
		request.setAttribute("listBoard", listBoard);
		return "boardList";
	}
	
	@RequestMapping("/listDetail")
	public String boardListDetail(HttpServletRequest request) {
		int bno = Integer.parseInt(request.getParameter("bno"));
		bService.increaseHitcount(bno);
		BoardDto list = bService.getBoardDtoByBno(bno);
		request.setAttribute("list", list);
		return "boardDetail";
	}
	
	@RequestMapping("/write")
	public String boardWritePost() {
		return "boardWritePost";
	}
	
	@RequestMapping("/write/action")
	public String boardWriteAction(BoardDto dto) {
		bService.writePost(dto);
		return "forward:/board/list";
		//return "redirect:/board/list";
	}
	
	@RequestMapping("/modify")
	public String modifyPost(HttpServletRequest request) {
		request.setAttribute("bno", Integer.parseInt(request.getParameter("bno")));
		request.setAttribute("title", request.getParameter("title"));
		request.setAttribute("content", request.getParameter("content"));
		return "modifyPost";
	}
	
	@RequestMapping("/modify/action")
	public String boardModifyPostAction(int bno, String title, String content) {
		bService.modifyPost(bno, title, content);
		return "forward:/board/listDetail?bno=" + bno;
	}
	
	@RequestMapping("/delete/action")
	public String boardDeletePost(int bno) {
		bService.deletePost(bno);
		return "forward:/board/list";
	}
}
