<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>ex03_include.jsp 페이지에서 출력된 내용입니다.</h3>
<hr>
<%
 String msg = "ex03_include.jsp";
 pageContext.include("ex03_include2.jsp");
%>
<hr>
<%--  test 파라미터 :  <%= request.getParameter("test") %>
 --%>
</body>
</html>