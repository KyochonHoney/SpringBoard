package com.es.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.es.dto.BoardDto;
import com.es.dto.MemberDto;
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
	
	@RequestMapping("/join")
	public String joinPage() {
		return "join";
	}
	
	@RequestMapping("/join/action")
	public String startJoinPage(String id, String pw, String name, String email) {
		bService.joinMember(id, pw, name, email);
		return "forward:/board/list";
	}
	
	@RequestMapping("/login")
	public String loginPage() {
		return "login";
	}
	
	@RequestMapping("/login/action")
	public String loginCheck(HttpServletRequest request) {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		boolean check = bService.checkPw(id, pw);
		if(check) {
			 HttpSession session = request.getSession();
		     session.setAttribute("memberList", bService.getMemberList(id));
		     MemberDto dto = (MemberDto)request.getSession().getAttribute("memberList");
		}
		return check ? "forward:/board/list" : "login";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request) {
		request.getSession().removeAttribute("memberList");
		return "boardList";
	}
	
	@RequestMapping(value = "/nextList", method = RequestMethod.POST)
	public @ResponseBody ArrayList<BoardDto> getNextList(@RequestParam("page") int page) {
	    ArrayList<BoardDto> list = (ArrayList<BoardDto>)bService.getNextList(page);
	    return list;
	}
	
	@RequestMapping(value = "/checkId", method = RequestMethod.GET)
	public @ResponseBody String checkId(@RequestParam("id") String id) {
		return bService.checkId(id) ? "none" : "duplicate";
	}
}
