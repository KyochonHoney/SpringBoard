<%@page import="com.es.dto.BoardDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<%
		int pageNum = 1;
		int startPNum = 1;
		int endPNum = 1;
		int lastPageNum = 1;
		ArrayList<BoardDto> list1 = null;
	if(session.getAttribute("memberList")==null){	//로그인 안된 상태
		%>
		<script>
			alert("로그인부터 하세요");
			location.href="${pageContext.request.contextPath}/board/login";
		</script>
		<%
	} else{
		list1 = (ArrayList<BoardDto>)request.getAttribute("listBoard");	//자 = 부 관계는 안되기 때문에 자신의 클래스로 형변환
		pageNum = (Integer)request.getAttribute("page");
		//startPNum = (Integer)request.getAttribute("startPNum");
		//endPNum = (Integer)request.getAttribute("endPNum");
		lastPageNum = (Integer)request.getAttribute("lastPageNum");
	}
%>
	<head>
        <meta charset="UTF-8">
        <title>게시글 목록</title>
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
            .logout {
                float: right;
                color: #007bff;
                text-decoration: none;
                transition: color 0.3s;
            }
            .logout:hover {
                color: #0056b3;
            }
            #btn_write {
                background-color: #007bff;
                color: #ffffff;
                border: none;
                padding: 10px;
                border-radius: 4px;
                cursor: pointer;
                transition: background 0.3s;
            }
            #btn_write:hover {
                background-color: #0056b3;
            }
            table {
                margin: 20px 0;
            }
        </style>
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.min.js"></script>
        <script src="${contextPath}/resources/js/jquery-3.7.1.min.js"></script>
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
            <div class="header">
                <h1>게시글 전체보기</h1>
                <a class="logout" href="${contextPath}/board/logout">로그아웃</a>
                <div style="clear:both"></div>
            </div>
			<table class="table table-striped" page="<%= pageNum %>">
				<tr>
					<td class="bno">글번호</td>
					<td>제목</td>
					<td>작성자</td>
					<td>작성일시</td>
					<td>조회수</td>
				</tr>
				<%
					if(list1 != null) {
						for(BoardDto vo : list1){
				%>
							<tr>
								<td class="bno"><%=vo.getBno() %></td>
								<td><%=vo.getTitle() %></td>
								<td><%=vo.getWriter() %></td>
								<td><%=vo.getWritedate() %></td>
								<td><%=vo.getHitCount() %></td>
							</tr>
				<%
						}
					}
				%>
			</table>
			<button id="btn_write">글작성</button>
			<%-- <style>
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
			</div> --%>
		</div>
	</body>
	<script>
		let page = <%=pageNum%>;
		$(function(){
			$(window).scroll(function(){
				var scrollTop = $(window).scrollTop();
				var innerHeight = $(window).height();
				var scrollHeight = $(document).height();
				if(scrollTop + innerHeight >= scrollHeight){
					page++;
					$.ajax({
						type : 'post',
						data : {"page" : page },
						url : '${pageContext.request.contextPath}/board/nextList',
						success : function(obj) {
							for(let i = 0; i < obj.length - 1; i++){
								let str = "<tr>"
										+	"<td class=\"bno\">" + obj[i].bno + "</td>"
										+	"<td>" + obj[i].title + "</td>"
										+	"<td>" + obj[i].writer + "</td>"
										+	"<td>" + obj[i].writedate + "</td>"
										+	"<td>" + obj[i].hitCount + "</td>"
										+"</tr>"
								$(".table-striped").append(str);		
							}
						}
					})
				}
			});
		});
	</script>
</html>