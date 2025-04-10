 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<%@page import="model.member.MemberDAO"%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <%
         String id = request.getParameter("id"); 
        String old_password = request.getParameter("old_password");
        String new_password = request.getParameter("new_password");
        String new_password2 = request.getParameter("new_password2");

        MemberDAO dao = new MemberDAO();
        boolean result = dao.updatePass(id,old_password,new_password);

        if(result) {
            session.invalidate();
    %>
            <script>
                alert('성공함');
                self.close(); 
                
                opener.location.href='loginForm.jsp';
            </script>
    <%
        } else {
    %>
            <script>
                alert('실패함');
                history.back();
            </script>
    <%
        }
    %>
</body>
</html>