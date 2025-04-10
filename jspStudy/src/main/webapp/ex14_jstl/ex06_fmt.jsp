<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl 형식화 태그</title>
</head>
<body>
    <h3>날짜 관련 형식 지정하기</h3>

    <c:set var ="today" value="<%= new Date() %>"></c:set>
    년 월일 : <fmt:formatDate value="${today }" type="date"/><br>
    시분초 : <fmt:formatDate value="${today }" type="time"/><br>
    형식 지정 : <fmt:formatDate value="${today }"  pattern="yyyy년 MM월 dd일 HH:mm:ss a E"/>
    <p>
    pattern 속성은 SimpleDateFormat에서의 사용하는 형식화 문자와 같다.ㄴ
    </p>
    <%-- Format클래스
        1. format() : 객체 =>형식화된 문자열
        2. parse() : 형식화 된 문자열 => 객체
     --%>
</body>
</html>