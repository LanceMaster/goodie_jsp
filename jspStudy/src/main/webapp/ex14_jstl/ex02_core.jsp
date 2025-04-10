<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <h3>조건문 관련 태그 : if , choose 태그</h3>

    <!-- 2개는 똑같은 것이다. 
    이 머저리 jstl은 else가 없다.
    그럼 어카하냐? choose를 선택해야한다.
     -->
    <c:if test="${5 < 10}">
        <h4>5는 10보다 작다</h4>
    </c:if>

    <c:choose>
        <c:when test="${5+10 == 25 }">
            <h4>5+ 10이 25겠냐</h4>
        </c:when>
        <c:when test="${5+10 == 15}">
            <h4>5+10은 15이다</h4>
        </c:when>
        <%-- 위에 있는 c when이 전부다 false일때 otherwise가 타는듯  --%>
        
        <c:otherwise>
            <h4>아 나 수학 몰라 더하기 몰라</h4>
        </c:otherwise>
    </c:choose>


</body>
</html>