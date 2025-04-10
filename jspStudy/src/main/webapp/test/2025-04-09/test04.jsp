<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 해당 속성의 값이 나온다.  -->
<h2>${param.name}</h2> 
<%-- <h2><%= session.getAttribute("name") %></h2> 
 --%>
<h2>${param.age }</h2>
<h2>${param.gender }</h2>
<h2>${param.year }</h2>
</body>
</html>