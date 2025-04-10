<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>jstl 형식화 태그 : parse 관련 태그</title>
  </head>
  <body>
    <h3>Format 된 숫자를 숫자로 변경</h3>

    <%--숫자 변경 --%>
    <fmt:parseNumber
      value="200,000"
      var="num1"
      pattern="##,###"
    ></fmt:parseNumber>
    <fmt:parseNumber
      value="100,000"
      var="num2"
      pattern="##,###"
    ></fmt:parseNumber>
    합 : ${num1 } + ${num2 } = ${num1+num2 }
    <br />

    <%-- 문제 : 20,000 + 10,000 = 30,000 출력하기 위의 num1과 num2를 출력하기
    --%> <%--
    <fmt:formatNumber
      value="${num1}"
      pattern="##,###"
      var="num3"
    ></fmt:formatNumber>
    <fmt:formatNumber
      value="${num2}"
      pattern="##,###"
      var="num4"
    ></fmt:formatNumber>
    <fmt:formatNumber
      value="${num1+num2}"
      pattern="##,###"
      var="num_p"
    ></fmt:formatNumber>
    합 : ${num3} + ${num4} = ${num_p} --%> 합:
    
    문제 : 위의 num1과 num2에 pattern 추가하고 해보기
    <br>
    <fmt:formatNumber value="${num1}" pattern="##,###" />
    +
    <fmt:formatNumber value="${num2}" pattern="##,###" />
    =
    <fmt:formatNumber value="${num1 + num2}" pattern="##,###" />

    <br />
    
    <h3>Format 된 날짜를 날짜형으로 변경하기</h3>
    
    <fmt:parseDate value="2025-12-25 12:00:00" pattern="yyyy-MM-dd HH:mm:ss" var="day"></fmt:parseDate>
    ${day}
    <br>
    <%-- 화면에 그냥 저장함 --%>
    <fmt:parseDate value="2025-12-25 12:00:00" pattern="yyyy-MM-dd HH:mm:ss"></fmt:parseDate>
    <br>
    <fmt:formatDate value = "${day}" pattern="E요일"></fmt:formatDate>
    ${test} <br> 
  </body>
</html>
