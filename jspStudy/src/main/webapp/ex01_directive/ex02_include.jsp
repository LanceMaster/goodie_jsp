<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- /webapp/ex01_directive/ex02_includeDirective.jsp  -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String msg = "ex02_includeDirective.jsp 페이지의 msg 변수";
	%>

	<!-- msg를 include에 만들어서 directive2에서 같은 msg변수 사용  -->
	<!-- servlet을 동시에 만들어준다? 해당것이 servlet  -->
	<h1>ex02_includeDirective.jsp 입니다!!!!!!!!!!!!!!!</h1>
	<%@ include file="ex02_includeDirective2.jsp"%>
	
	<!--
	
	<hr>
<p>
	ex02_includeDirective.jsp 페이지에 포함됩니다.<br> 2개의 페이지가 같은 서블릿으로 변경되므로
	변수 공유가 가능합니다.<br> msg :
	<%=msg %>
</p>
	  -->
	  
	<hr>
	<h3>include 지시어를 이용하여 다른페이지의 내용을 가져올수 있습니다.</h3>
</body>
</html>