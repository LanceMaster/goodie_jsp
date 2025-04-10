<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- \webapp\ex14_jstl\ex03_core.jsp --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl core 태그 : forEach</title>
</head>
<body>
    <%-- 반복관련 태그 --%>
    <h3>반복 관련 태그 : forEach</h3>
    <h4>1에서 10까지 숫자 출력하기</h4>
    <c:forEach var="i" begin="1" end="10">
    ${i}&nbsp;&nbsp;
</c:forEach>

    <h4>1에서 10까지 홀수 출력하기</h4>
    <%-- step으로 2씩증가하라고 하면 됨 --%>
    <c:forEach var="i" begin="1" end="10" step="2">
    ${i}&nbsp;&nbsp;
</c:forEach>
    <br>
    <c:forEach var="i" begin="1" end="10" step="2">
        <c:if test="${i %2 == 1 }">
    ${i}&nbsp;&nbsp;
    </c:if>
    </c:forEach>
    <%-- 짝수는 어캐할까 --%>
    <h4>짝수로 1에서 10까지 출력하기</h4>
    <c:forEach var="i" begin="1" end="10">
        <c:if test="${i %2 == 0 }">
    ${i}&nbsp;&nbsp;
    </c:if>
        <br>
    </c:forEach>
    <br>
    <%-- 1에서 10까지 sum은 jstl에서 어떻게 하냐
         c:set var을 해서 value에다 sum+i 함
     --%>
    <h4>1에서 10까지 합 구하기</h4>
    <c:forEach var="i" begin="1" end="10">
        <!-- 하나의 변수선언이라고 하면 편할듯 sum이라는 변수에 넣는다 setAttribute랑 같은거?  -->
        <c:set var="sum" value="${sum+i}"></c:set>
    </c:forEach>
    1에서 10까지의 합 : ${sum}
    <br>
    <c:set var="sum" value="${0}"></c:set>

    <h4>1에서 10까지의 짝수 합 출력하기</h4>
    <c:forEach var="i" begin="2" end="10" step="2">
        <c:set var="sum" value="${sum+i}"></c:set>
    </c:forEach>
    1에서 10까지의 합 : ${sum}
    <br>

    <%-- 이렇게 sum을 다른데서 쓸때는 value를 0으로 다시 set 해줘야한다. --%>
    <c:set var="sum" value="${0}"></c:set>

    <h4>1에서 10까지의 홀수 합 출력하기</h4>
    <c:forEach var="i" begin="1" end="10" step="2">
        <c:set var="sum" value="${sum+i}"></c:set>
    </c:forEach>
    1에서 10까지의 합 : ${sum}
    <br>

    <h4>jstl 태그를 이용하여 반복문 구구단을 만들어보자</h4>
    <c:forEach var="i" begin="2" end="9">
        <h4>${i}단</h4>
        <c:forEach var="j" begin="2" end="9">
            ${i} * ${j} = ${i*j}<br>
        </c:forEach>
    </c:forEach>
    <br>
    
    <h3>forEach 태그를 이용하여 List 객체의 요소 출력하기</h3>
   
    <%
    List<Integer> testList = new ArrayList<>();
    for(int i = 1; i <= 10; i++) {
     testList.add(i * 10);   
    }
    pageContext.setAttribute("testlist", testList);
    %>
    
    <%-- jstl로 출력하기  --%>
    <%-- 개선된 for문이랑 굉장히 비슷함 a는 리스트의 값들 저장 items는 list 지정 varStatus는 index --%>
    <c:forEach var = "a" items="${testlist }" varStatus="s">
        <h5>${s.index }:${a } &nbsp;&nbsp;</h5>
    
    </c:forEach>
    
    <%-- list를 두줄로 출력하기? --%>
    <c:forEach var="var" items="${testlist }" varStatus="s">
    ${s.index } : ${var}
    <c:if test="${s.index == 5}">
    <br>
    </c:if>
    
    </c:forEach>
</body>


</html>