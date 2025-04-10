<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="test" uri="/ELFunctions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%-- /jspstudy2/src/main/webapp/test/test1.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>두개의 파라미터값을 계산하기</title>
</head>
<body>
    <form method="post">
        x:<input type="text" name="x" value="${param.x}"><br>
        y:<input type="text" name="y" value="${param.y}"> <input
            type="submit" value="더하기">
    </form>
    <p>
        합계 : ${test:add(param.x,param.y)}<br>

    </p>
    <hr style="width: 100%; border: 1px solid black;">
    <h4>if 태그를 이용하여 출력하기</h4>
    <c:if test="${test:add(param.x,param.y) < 0}">
        <h4>${test:add(param.x,param.y)}은 음수이다.</h4>
    </c:if>
    <br>
    <h4>Choose 태그를 이용하여 출력하기</h4>
    <%-- Choose --%>
    <c:choose>
        <c:when test="${test:add(param.x,param.y) < 0}">
            <h4>${test:add(param.x,param.y)}은 음수이다.</h4>
        </c:when>
        <c:when test="${test:add(param.x,param.y) > 0}">
            <h4>${test:add(param.x,param.y)}은 양수이다.</h4>
        </c:when>
        <c:otherwise>
            <h4>몰루</h4>
        </c:otherwise>


    </c:choose>
</body>
</html>