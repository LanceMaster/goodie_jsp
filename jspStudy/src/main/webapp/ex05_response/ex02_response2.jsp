<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>ex02_response2.jsp</h2>
ex01_response1.jsp 페이지에서 요청하면 이 페이지가 호출됩니다.<br>
브라우저의 url 부분도 이페이지의 url로 변경이 되어있습니다.<br>
이런 현상을 redirect(리다이렉트)라고 불립니다.
이후의 forward와 비교하여 정확한 의미를 이해하고 계셔야합니다.<br>
<h2><%= request.getParameter("id") %></h2>

</body>
</html>