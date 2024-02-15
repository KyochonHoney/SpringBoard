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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<style>
    body {
        padding: 20px;
        font-family: 'Roboto', sans-serif;
    }
    .header {
        width: 100%;
        background-color: #343a40;
        color: #fff;
        padding: 10px 0;
        text-align: center;
        margin-bottom: 20px;
    }
    form {
        width: 600px;
        margin: 0 auto;
        background-color: #fff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.1);
    }
    form input[type="text"],
    form textarea {
        width: 100%;
        margin-bottom: 10px;
        border: none;
        border-bottom: 2px solid #6c757d;
        border-radius: 0;
        transition: border 0.3s;
    }
    form input[type="text"]:focus,
    form textarea:focus {
        border-bottom: 2px solid #007bff;
        outline: none;
    }
    form input[type="submit"] {
        background-color: #007bff;
        color: #ffffff;
        border: none;
        padding: 10px;
        width: 100%;
        border-radius: 4px;
        cursor: pointer;
        transition: background 0.3s;
    }
    form input[type="submit"]:hover {
        background-color: #0056b3;
    }
</style>
</head>
<body>
    <div class="header">
        <h1>게시글 수정하기</h1>
    </div>
    <form action="${pageContext.request.contextPath}/board/modify/action" method="get">
        <div class="form-group">
            <label>제목 :</label>
            <input type="text" name="title" class="form-control" value="<%=title%>" readonly/>
        </div>
        <div class="form-group">
            <label>내용 :</label>
            <textarea name="content" class="form-control" rows="5"><%=content%></textarea>
        </div>
        <input type="hidden" name="bno" value="<%=bno %>"/>
        <input type="submit" value="수정하기"/>
    </form>
</body>
</html>