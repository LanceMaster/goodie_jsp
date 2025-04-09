<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%--
    /webapp/member/main.jsp
    1.로그인 여부 검증 
      =>
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <%
    String login = (String) session.getAttribute("login");
    if (login != null) {
    %>



    <h3><%=login%>님이 로그인 하셨습니다.
    </h3>
    <h3>
        <a href="logout.jsp">로그아웃</a>
    </h3>
    <h3>
        <a href="info.jsp?id=<%=login%>">회원정보보기</a>
    </h3>
    <%-- 관리자로 로그인 된 경우 : 회원 목록 조회 --%>
    <%
    if (login.equals("admin")) {
    %>
    <h3>
        <a href="list.jsp">회원 목록 보기</a>
    </h3>
    <%
    }
    %>
    <%
    } else {
    %>
    <script type="text/javascript">
					alert("로그인 후 이용하세요");
					location.href = "loginForm.jsp";
				</script>
    <%}%>
</body>
</html>