<%@page import="java.util.Arrays"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <h3>for each 태그르 이요하여 map 객체 출력해보기</h3>

    <%
    Map<String, Object> map = new HashMap<>();
    map.put("name", "홍길동");
    map.put("today", new Date());
    map.put("age", 20);
    pageContext.setAttribute("map1", map);
    %>
    <%-- 변수명이 아니라 속성 key값을 봐야함 --%>
    <c:forEach var="m" items="${map1}" varStatus="stat">
   ${stat.count}:${m.key}=${m.value}
   <br>
    </c:forEach>
    <%-- 파라미터 getparameter처럼 할수있다. --%>
    <h3>map 객체를 el을 이용해ㅓㅅ 출력하자</h3>
    이름 : ${map1.name}
    <br> 나이 : ${map1.today}
    <br> 오늘날짜 : ${map1.today }

    <h3>for Each를 이용하여 배열 객체 출력하기 </h3>
    <c:set var = "arr" value="<%=new int[]{10,20,30,40,50} %>">
    </c:set>
    
    <c:forEach var = "a" items = "${arr }" varStatus="stat" >
    arr[${stat.index }] = ${a }
    </c:forEach>
    <h3>배열 객체를 el을 이용하여 출력하기</h3>
    arr[0] = ${arr[0]}<br>
    arr[1] = ${arr[1]}<br>
    arr[2] = ${arr[2]}<br>
    arr[3] = ${arr[3]}<br>
    arr[4] = ${arr[4]}<br>
    <h3>List 객체를 el을 이용하여 출력하기</h3>
    <c:set var = "list" value ="<%=Arrays.asList(10,20,30,40,50,60) %>"></c:set>
    list[0] = ${list[0]}<br>
    list[1] = ${list[1]}<br>
    list[2] = ${list[2]}<br>
    
    <h3>for each 태그를 이용하여 배열 객체의 두번째 요소부터 세번째 요소만 출력하기 </h3>
    <!-- begin end 사용  -->
    <c:forEach var="a" items= "${arr }" varStatus="stat" begin="2" end="3">
        arr[${stat.index}] = ${a }
    </c:forEach>
    
    <h3>짝수 인덱스 요소만 출력하기</h3>
    <!-- begin end 사용  -->
    <c:forEach var="a" items= "${arr }" varStatus="stat" step = "2">
        arr[${stat.index}] = ${a }
    </c:forEach>
    
    <h3>홀수 인덱스 요소만 출력하기</h3>
    <!-- begin end 사용  -->
    <c:forEach var="a" items= "${arr }" varStatus="stat" step = "2" begin="1">
        arr[${stat.index}] = ${a }
    </c:forEach>
    
    
    
    
</body>
</html>