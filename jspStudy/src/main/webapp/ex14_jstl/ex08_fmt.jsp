<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>fmt 태그 : 인코딩</title>
</head>
<body>
    <fmt:requestEncoding value="utf-8" />

    <h2>requestEncoding 사용</h2>
    <hr>
    <form method="post" name="f">
        이름 : <input type="text" name="name" value="${param.name}"><br>
        입사일 : <input type="date" name="hiredate"
            value="${param.hiredate}"><br> 급여 : <input
            type="text" name="salary" value="${param.salary}"> <br>
        <%-- paramvalues.job : jobㅠㅏ라미터의 값들을 배열로 리턴  
                 ${fn:join} : 배열의 요소들을 ,로 연결하여 문자열로 리턴
            --%>

        <c:set var="jobs" value="${fn:join(paramValues.job,',')}">

        </c:set>
        담당업무 : <input type="checkbox" name="job" value="서무"
            <c:if test="${fn:contains(jobs,'서무')}">checked</c:if>>
        서무 &nbsp; <input type="checkbox" name="job" value="놀기"
            <c:if test="${fn:contains(jobs,'놀기')}">checked</c:if>>
        놀기 &nbsp; <input type="submit" value="전송">
    </form>

    이름 : ${param.name}
    <br> 입사일 :
    <c:if test="${not empty param.hiredate}">
        <fmt:parseDate value="${param.hiredate}" pattern="yyyy-MM-dd"
            var="hiredate" />
        <fmt:formatDate value="${hiredate}" pattern="yyyy년 MM월 dd일 E요일" />
    </c:if>
    <br> 급여 :
    <c:if test="${not empty param.salary}">
        <fmt:formatNumber value="${param.salary}" pattern="#,###" />
    </c:if>
    <br> 연봉 :
    <c:if test="${not empty param.salary}">
        <fmt:parseNumber value="${param.salary}" var="y_salary"
            pattern="#,###" />
        <fmt:formatNumber value="${y_salary * 12}" pattern="#,###" />
    </c:if>

    <br> 담당업무 :
    <c:forEach items="${paramValues.job}" var="j">${j}&nbsp;</c:forEach>
</body>
</html>