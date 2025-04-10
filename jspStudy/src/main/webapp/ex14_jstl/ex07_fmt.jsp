<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl 형식화 태그 : parse 관련 태그</title>
</head>
<body>
<h3>Format 된 숫자를 숫자로 변경</h3>

<%--숫자 변경 --%>
<fmt:parseNumber value="20,000" var ="num1" pattern="##,###"></fmt:parseNumber>
<fmt:parseNumber value="10,000" var ="num2" pattern="##,###"></fmt:parseNumber>
합 : ${num1 } + ${num2 } = ${num1+num2 }
</body>
</html>