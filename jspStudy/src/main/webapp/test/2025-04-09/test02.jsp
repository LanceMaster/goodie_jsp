<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- /jspstudy2/src/main/webapp/test/test2.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입력된 수까지의 합 구하기</title>
</head>
<body>
    <form method="post">
        숫자:<input type="text" name="num" value="${param.num}"> <input
            type="submit" value="숫자까지의 합 구하기">
    </form>

    <c:forEach var="i" begin="1" end="${param.num}">
        <c:set var="sum" value="${sum+i}">
        </c:set>
    </c:forEach>
    1에서 ${param.num}의 값 : ${sum} 입니다.

    <hr style="width: 100%; border: 1px solid black;">
    <h4>if 태그를 이용하여 출력하기</h4>
    <c:if test="${sum % 2 == 0}">
        <h4> ${sum} 은 짝수임</h4>
    </c:if>
    <h4>Choose 태그를 이용하여 출력하기</h4>
    <%-- Choose --%>
    <c:choose>
        <c:when test="${sum % 2 == 0}">
            <h4> ${sum} 은 짝수임</h4>
        </c:when>
        <c:when test="${sum % 2 == 1}">
            <h4> ${sum} 은 홀수임</h4>
        </c:when>
    
    </c:choose>
</body>
</html>