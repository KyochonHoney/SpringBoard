<%@page import="com.es.dto.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	BoardDto dto = (BoardDto)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>
		<script> 
			$(function(){
				$("#btn_to_list").click(function(){
					//history.back(-1);
					location.href = "${pageContext.request.contextPath}/board/list?page=1";
				});
				$("#btn_modify").click(function(){
					let str = "${pageContext.request.contextPath}/board/modify?bno="+<%=dto.getBno() %>+"&title="+"<%=dto.getTitle() %>"+"&content="+"<%=dto.getContent() %>";
					location.href= str;
				});
				$("#btn_delete").click(function(){
					location.href = "${pageContext.request.contextPath}/board/delete/action?bno="+<%=dto.getBno()%>;
				});
				
			});
		</script>
		<style>
			table{ border: 2px solid black;}
		</style>
	</head>
	
	<body>
		<h1>게시글 상세보기</h1>
		<table>
			<tr>
				<th>글 번호</th>
				<td><%=dto.getBno() %></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><%=dto.getWriter() %></td>
			</tr>
			<tr>
				<th>작성일시</th>
				<td><%=dto.getWritedate() %></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><%=dto.getContent() %></td>
			</tr>
			<tr>
				<th>조회수</th>
				<td><%=dto.getHitcount() %></td>
			</tr>
		</table>
		<button id="btn_to_list">목록보기</button>
		<button id="btn_modify">수정하기</button>
		<button id="btn_delete">삭제하기</button>
	</body>
</html>