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
        <title>게시글 상세보기</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>
        <script> 
            $(function(){
                $("#btn_to_list").click(function(){
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
            body {
                padding: 20px;
                font-family: 'Roboto', sans-serif;
                background-color: #f8f9fa;
            }
            table {
                width: 100%;
                margin-bottom: 1rem;
                background-color: transparent;
            }
            table th,
            table td {
                padding: 1.5rem;
                vertical-align: top;
                border-top: 1px solid #dee2e6;
            }
            table thead th {
                vertical-align: bottom;
                border-bottom: 2px solid #dee2e6;
            }
            table tbody + tbody {
                border-top: 2px solid #dee2e6;
            }
            .btn {
                display: inline-block;
                font-weight: 400;
                color: #fff;
                text-align: center;
                vertical-align: middle;
                cursor: pointer;
                background-color: #007bff;
                border: 1px solid transparent;
                padding: 0.375rem 0.75rem;
                font-size: 1rem;
                line-height: 1.5;
                border-radius: 0.25rem;
                transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out, border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
            }
            #btn_to_list {
                background-color: #6c757d;
            }
            #btn_modify {
                background-color: #28a745;
            }
            #btn_delete {
                background-color: #dc3545;
            }
            .btn:hover {
                opacity: 0.85;
            }
            .btn + .btn {
                margin-left: 10px;
            }
        </style>
    </head>
    
    <body>
        <h1>게시글 상세보기</h1>
        <table class="table table-bordered">
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
                <td><%=dto.getHitCount() %></td>
            </tr>
        </table>
        <button id="btn_to_list" class="btn">목록보기</button>
        <button id="btn_modify" class="btn">수정하기</button>
        <button id="btn_delete" class="btn">삭제하기</button>
    </body>
</html>