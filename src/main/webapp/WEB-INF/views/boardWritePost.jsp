<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>게시글 쓰기</h1>
	<form action ="${pageContext.request.contextPath}/board/write/action" method="post">
		제목 : <input type="text" name="title"/>
		내용 : <textarea name="content"></textarea>
		<input type="hidden" name="writer" value="수정하기"/>
		<input type="submit" value="작성완료"/>
	</form>
</body>
</html>