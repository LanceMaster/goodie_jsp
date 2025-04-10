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
<link rel="stylesheet" href="<%=path%>/css/footer.css">
<%-- 작성한 페이지의 head 태그값 . title 태그 제외 --%>
<sitemesh:write property="head" />
</head>
<body>

    <sitemesh:write property="body" />

    <footer class="custom-footer">
        <style>
.custom-footer {
    position: fixed;
    bottom: 0;
    width: 100%;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: white;
    text-align: center;
    padding: 15px 0;
    font-size: 14px;
    box-shadow: 0 -2px 10px rgba(0, 0, 0, 0.1);
}
</style>
        © 2024 구디아카데미 김준희가 만들었습니다.
    </footer>
</body>
</html>
