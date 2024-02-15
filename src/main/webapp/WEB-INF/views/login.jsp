<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<style>
    body {
        padding: 20px;
        background-color: #f8f9fa;
        font-family: 'Roboto', sans-serif;
    }
    .header {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        background-color: #343a40;
        color: #fff;
        padding: 10px 0;
        text-align: center;
    }
    form {
        width: 300px;
        margin: 60px auto 0;
        background-color: #fff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.1);
    }
    form input {
        margin-bottom: 10px;
        border: none;
        border-bottom: 2px solid #6c757d;
        border-radius: 0;
        transition: border 0.3s;
    }
    form input:focus {
        border-bottom: 2px solid #007bff;
        outline: none;
    }
    .button-group {
        display: flex;
        justify-content: space-between;
        align-items: center;
    }
    .button-group input[type="submit"] {
        width: calc(50% - 5px);
    }
    .button-group a {
        width: calc(50% - 5px);
        text-align: center;
        background-color: #6c757d;
        color: #fff;
        padding: 10px;
        border-radius: 4px;
        transition: background 0.3s;
        text-decoration: none;
    }
    .button-group a:hover {
        background-color: #5a6268;
    }
    .id-check {
        width: calc(50% - 5px);
        text-align: center;
        background-color: #6c757d;
        color: #fff;
        padding: 10px;
        border-radius: 4px;
        transition: background 0.3s;
        text-decoration: none;
        cursor: pointer;
    }
    .id-check:hover {
        background-color: #5a6268;
    }
</style>
</head>
<body>
    <div class="header">
        <h1>게시판 로그인</h1>
    </div>
    <form action="${pageContext.request.contextPath}/board/login/action" method="post">
        <div class="form-group">
            <label>아이디 :</label>
            <input type="text" name="id" class="form-control"/>
        </div>
        <div class="form-group">
            <label>비밀번호 :</label>
            <input type="password" name="pw" class="form-control"/>
        </div>
        <div class="button-group">
            <input type="submit" value="로그인"/>
            <a href="${pageContext.request.contextPath}/board/join">회원가입</a>
        </div>
    </form>
</body>
</html>