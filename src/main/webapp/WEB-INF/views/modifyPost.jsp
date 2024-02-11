<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	    int bno = Integer.parseInt(request.getParameter("bno"));
    	String title = request.getParameter("title");
    	String content = request.getParameter("content");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정하기</title>
</head>
<body>
	제목 : <%=title %> <br/>
	<form action="${pageContext.request.contextPath}/board/modify/action" method="get">
	본문 : <input type="text" name="content" value="<%=content%>"/> <br/>
		<input type="hidden" name="bno" value="<%=bno %>"/>
		<input type="hidden" name="title" value="<%=title %>"/>
		<input type="submit" value="수정하기"/>
	</form>
</body>
</html>