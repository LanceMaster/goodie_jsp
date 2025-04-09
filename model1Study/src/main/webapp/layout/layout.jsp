<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%-- /webapp/layout/layout.jsp --%>
<%
String path = request.getContextPath();
%>
<html>
<head>
<meta charset="UTF-8">
<%-- 작성한 페이지의 title값을 갖고와라  --%>
<title><sitemesh:write property="title" /></title>   
<link rel="stylesheet" href="<%=path%>/css/main.css">

<%-- 작성한 페이지의 head 태그값 . title 태그 제외 --%>
<sitemesh:write property="head" /> 
</head>
<body>
    <table>
        <tr>
            <td colspan="3" style="text-align: right">
                <%
                String login = (String) session.getAttribute("login");
                if (login == null) {
                %> <a href="<%=path%>/member/loginForm.jsp">로그인</a> <a
                href="<%=path%>/member/joinForm.jsp">회원가입</a> <%
 } else {
 %> <%=login%>님. <a href="<%=path%>/member/logout.jsp">로그아웃</a> <%
 }
 %>
            </td>
        </tr>
        <tr>
            <td colspan="2"
                style="text-align: left; vertical-align: top">
                <%-- 작성한 페이지의 body 태그의 값. --%>
                <sitemesh:write property="body" /></td>
        </tr>
        <tr>
            <td colspan="3">구디아카데미</td>
        </tr>
    </table>
</body>
</html>
