<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- ex06_pageContext\ex01_city.jsp --%>
<%
String city = request.getParameter("city");
/**
브라우저와 상관없이 서버내부에서 ex01_seoul.jsp 또는 ex01_busan.jsp 페이지 포워딩 한다.
결과는 ex01_seoul.jsp 또는 ex01_busan.jsp의 결과로 브라우저로 응답 전달함
ex01_city.jsp 페이지와 포워드된 ex01_seoul.jsp | ex01_busan.jsp 페이지는 같은
request 영역에 속한 페이지다.
*/
System.out.println(city);
/* response.sendRedirect("ex01_" + city + ".jsp?city=" + city); */
pageContext.forward("ex01_"+city+".jsp"); 
/*
request와 response 객체 전달
*/
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <h1>This page should not be displayed.</h1>
</body>
</html>