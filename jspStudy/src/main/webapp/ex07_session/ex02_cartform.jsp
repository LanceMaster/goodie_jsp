<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> session을 이용한 장바구니</title>
</head>
<body>
<%-- ex02_cartAdd.jsp --%>

<%-- <%
session.setAttribute("id", session.getId());
session.setMaxInactiveInterval(30);
%> --%>
<form action="ex02.cartAdd.jsp" method="post">
    <select name="product">
        <option>사과</option>
        <option>귤</option>
        <option>포도</option>
    </select>
<input type="submit" value="추가하기">
</form>
<a href="ex02_cartView.jsp">장바구니 보기 </a>
</body>
</html>