<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PageContext 예제</title>
</head>
<body>
    <h2>PageContext 객체 : page 영역을 담당하는 객체 . 현재 페이지의 자원을 관리한다</h2>
    <h3>
        <%
        if (request == pageContext.getRequest()) {
        %>
        response 객체와 pageContext.getRequest()함수가 리턴하는 객체는 같은 객체이다.
        <%
        }
        %>
        <%
        if (request == pageContext.getResponse()) {
        %>
        response 객체와 pageContext.getResponse()함수가 리턴하는 객체는 같은 객체이다.
        <%
        }
        %>
        <%
        if (session == pageContext.getSession()) {
        %>
        session 객체와 pageContext.getSession()함수가 리턴하는 객체는 같은 객체이다.
        <% } %>
    </h3>
    <h3>
    pageContext 객체는 영역담당 객체이므로 속성관리 메서드를 가진다.
    </h3>
    <!--  여기서 pageContext에서 today라는 변수와 값을 지정을하고 바로 pageContext에서 getAttribute로 갖고옴  -->
<% pageContext.setAttribute("today",new Date()); %>
    today : <%= pageContext.getAttribute("today") %><br>
</body>
</html>