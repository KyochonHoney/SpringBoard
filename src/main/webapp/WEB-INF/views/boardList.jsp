<%@page import="com.es.dto.BoardDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%
	ArrayList<BoardDto> list1 = (ArrayList<BoardDto>)request.getAttribute("listBoard");	//자 = 부 관계는 안되기 때문에 자신의 클래스로 형변환
	int pageNum = (Integer)request.getAttribute("page");
	int startPNum = (Integer)request.getAttribute("startPNum");
	int endPNum = (Integer)request.getAttribute("endPNum");
	int lastPageNum = (Integer)request.getAttribute("lastPageNum");

	
	if(session.getAttribute("result")==null){	//로그인 안된 상태
		%>
		<script>
			//alert("로그인부터 하세요");
			//location.href="ExLogin.jsp";
		</script>
		<%
	} else{
		
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>게시글 목록</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
		<script src="${contextPath}/resources/js/jquery-3.8.1.min.js"></script>
		<script>
			$(function(){
				$("tr").click(function(){
					let bno = $(this).find(".bno").text();
					location.href = "${contextPath}/board/listDetail?bno=" + bno;
				});
				$("#btn_write").click(function(){
					location.href = "${contextPath}/board/write";
				});
			});
		</script>
	</head>
	
	<body>
		<div class="container">
			<h1>게시글 전체보기</h1>
			<a href="${contextPath}/board/logout" style="float: right;">로그아웃</a>
			<div style="clear:both"></div>
			<table class="table table-striped" page="<%= pageNum %>">
				<tr>
					<td class="bno">글번호</td>
					<td>제목</td>
					<td>작성자</td>
					<td>작성일시</td>
					<td>조회수</td>
				</tr>
				<%
					for(BoardDto vo : list1){
				%>
					
						<tr>
							<td class="bno"><%=vo.getBno() %></td>
							<td><%=vo.getTitle() %></td>
							<td><%=vo.getWriter() %></td>
							<td><%=vo.getWritedate() %></td>
							<td><%=vo.getHitcount() %>
						</tr>
				<%
					}
				%>
			</table>
			<button id="btn_write">글작성</button>
			<style>
				#pagination { font-size : 30px; width: 300px; margin: 0 auto;}
				#pagination > a { text-decoration : none;}
			</style>
			<div id="pagination">
			<%
				if(startPNum > 1) {
			%>
				<a href="${contextPath}/board/list?page=<%=startPNum-1 %>">&lt;&lt;</a>
			<% } for(int i = startPNum; i <=endPNum; i++) {
				if(i > lastPageNum) break;
				if(i == pageNum) { %>
				<span><%=pageNum %></span>
			<% } else { %>
				<a href="${contextPath}/board/list?page=<%=i %>"><%=i %></a>
			<% } 
			} if(endPNum + 1 <= lastPageNum){
			%>	
				<a href="${contextPath}/board/list?page=<%=endPNum + 1 %>">&gt;&gt;</a>
			<% } %>
			</div>
		</div>
	</body>
</html>