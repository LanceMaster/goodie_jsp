<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>session에 등록된 날짜를 조회하고, session 속성에서 제거하기</h3>
<%
if(session.getAttribute("current_date") == null) {
%>
    <%
    /*sendRedirect는 java쪽을 다시 아예 돌아가게 해주는건가  */
    response.sendRedirect("ex02_test.jsp");
    %>
    <h2>등록된 날짜가 없습니다.</h2>
<% 
} else {
%>
 <h2><%= session.getAttribute("current_date")   %></h2>
<%} %>    

<%-- <% session.invalidate(); %>
 --%>
 <% session.removeAttribute("current_date"); %>
 
 <button type="button" value="돌아가기" onclick="backup()">돌아가기</button>
<script type="text/javascript">
 function backup() {
	 console.log("테스트");
	 window.history.back(-1);
 }
</script>

</body>
</html>