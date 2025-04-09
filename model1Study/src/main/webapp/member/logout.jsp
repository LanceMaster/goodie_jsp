
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%--
1.session에 저장된 로그인 정보 삭제
2.로그인 페이지로 이동
 --%>
<%
// 1. 세션에 저장된 로그인 정보 삭제
//   => session.invalidate() : 세션에 저장된 모든 정보 삭제
session.invalidate();

// 2. 로그인 페이지로 이동
String msg = "로그아웃 되었습니다.";
%>
<script type="text/javascript">
    alert("<%=msg%>"); 
    location.href="loginForm.jsp";
    </script>