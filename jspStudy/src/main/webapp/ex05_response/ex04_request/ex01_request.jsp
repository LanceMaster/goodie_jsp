<%@page import="java.util.Arrays"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!--
    
      -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
String name = request.getParameter("name");
String age = request.getParameter("age");
String gender = request.getParameter("gender");
String hobby = request.getParameter("hobby");
String year = request.getParameter("year");

%>
이름 : <%= name != null ? name : "" %> <br>
나이 : <%= age != null ? age : "" %> <br>
성별 : <%= gender != null ? (gender.equals("1") ? "남" : "여") : "" %><br>
취미 : <%= hobby != null ? hobby : "" %><br>
출생년도 : <%= year != null ? year : "" %><br>

<hr>
<h3>모든 취미 정보 조회하기</h3>
<%
    String hobbies[] = request.getParameterValues("hobby");
    if (hobbies != null) {
        for(String h : hobbies) {
%>
<%= h %> &nbsp;&nbsp;&nbsp;&nbsp;
<% 
        }
    }
%>
<hr>
<h3>모든 파라미터 정보 조회하기</h3>
<table border="1">
    <tr><thead>파라미터이름</thead><thead>파라미터값</thead></tr>
    <%
    /* request.getParameterNames()로 모든 폼 요소의 이름과 값을 얻을수 있다.  */
    Enumeration e = request.getParameterNames();
    /* System.out.println(e); */
    while(e.hasMoreElements()) {
     String pname = (String)e.nextElement();
     /* key값에 대한 모든 값들을 다 갖고와라   */
     String values[] = request.getParameterValues(pname);
     
     System.out.println(pname);
     System.out.println(Arrays.toString(values));
    %>
    <tr><td><%=pname %></td>
    <td><% for (String s : values) { %>
        <%= s %> &nbsp;&nbsp;
    <%} %>
    </td>
    </tr>
    <%}%>  
 </table>


</body>
</html>
