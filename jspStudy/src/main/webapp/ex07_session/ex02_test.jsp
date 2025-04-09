<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
 Date current_date = new Date();
%>
<h3>현재 날짜를 session 객체에 등록하기</h3>
<%
 session.setAttribute("current_date", current_date); 
%>
등록된 날짜 :<%= (Date)session.getAttribute("current_date") %>
<br>
<%-- <% session.invalidate(); %>
 --%>
<a href="ex02_exam2.jsp">등록날짜 조회하기</a>


</body>
</html>