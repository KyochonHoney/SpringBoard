<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap" rel="stylesheet">
<style>
    body {
        padding: 20px;
        background-color: #f8f9fa;
        font-family: 'Roboto', sans-serif;
    }
    form {
        width: 300px;
        margin: 0 auto;
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
    #checkPWSpan {
        color: red;
        font-weight: bold;
    }
    .form-group label {
        font-weight: bold;
        color: #6c757d;
    }
    input[type="submit"] {
        background-color: #007bff;
        color: #ffffff;
        border: none;
        padding: 10px;
        width: 100%;
        border-radius: 4px;
        cursor: pointer;
        transition: background 0.3s;
    }
    input[type="submit"]:hover {
        background-color: #0056b3;
    }
    .id-check {
        width: 100%;
        text-align: center;
        background-color: #6c757d;
        color: #fff;
        padding: 10px;
        border-radius: 4px;
        transition: background 0.3s;
        text-decoration: none;
        cursor: pointer;
        margin-top: 10px;
        margin-bottom: 20px;
    }
    .id-check:hover {
        background-color: #5a6268;
    }
</style>
</head>
<body>
	<form action="${pageContext.request.contextPath}/board/join/action">
		이름 : <input type="text" name="name" id="name" required/> <br/>
		아이디 : <input type="text" name="id" required/>
		<div class="id-check">중복확인</div>
		비밀번호 : <input type="password" name="pw" id="pw" required/> <br/>
		비밀번호 확인 : <input type="password" name="pwCheck" id="pwCheck" required/><span id="checkPWSpan"></span> <br/>
		이메일 : <input type="email" name="email" id="email" required/> <br/>
		<input type="submit" value="회원가입"/>
	</form>
</body>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(function(){
		$("#email").click(function(){
			let pw = $("#pw").val();
			let pwCheck = $("#pwCheck").val();
			if(pw == pwCheck){
				$("#checkPWSpan").html("비밀번호가 일치합니다");
				$("#checkPWSpan").css("color", "green");
			} else{
				$("#checkPWSpan").html("비밀번호가 일치하지 않습니다");
				$("#checkPWSpan").css("color", "red");
			}
		});
	});
	$(document).ready(function(){
		  $(".id-check").click(function(){ 
		    var id = $("input[name='id']").val();
		    $.ajax({
		      url: "${pageContext.request.contextPath}/board/checkId",
		      data: { "id" : id }, 
		      success: function(data){ 
		        if(data == "duplicate"){
		          alert("이미 사용 중인 아이디입니다.");
		        } else {
		          alert("사용 가능한 아이디입니다.");
		        }
		      }
		    });
		  });
		});
</script>
</html>