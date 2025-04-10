<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
Calendar cal = Calendar.getInstance();
int currentYear = cal.get(Calendar.YEAR);
request.setAttribute("currentYear", currentYear);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <form action="test04.jsp" method="post">
        이름:<input type="text" name="name"><br> 
        나이:<input type="text" name="age"><br> 
        성별:
        <input type="radio" name="gender" value="1">남 
        <input type="radio" name="gender" value="2">여
        <br> 
        출생연도: <select name="year"> 
                    <c:forEach var="year" begin="${currentYear-50}" end="${currentYear}" step="1">
                    <option value="${year}">${year}</option>
                    </c:forEach>
               </select><br> 
        <input type="submit" value="전송">
    </form>
    <script type="text/javascript">
     
    
    </script>
</body>
</html>