<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /webapp/ex13_EL/ex3_elFunction.jsp --%>
<!-- 아래가 함수의 이름인듯?  -->
<%@ taglib prefix="test" uri="/ELFunctions" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL에서 자바 함수이용하기</title>
</head>
<body>
<form method="post">
  x : <input type="text" name="x" value ="${param.x}" ><br>
  y : <input type="text" name="y" value = "${param.y}">
  <input type="submit" value="더하기">
</form>
<p>
합계 : ${test:add(param.x,param.y) }<br>
</body>
</html>