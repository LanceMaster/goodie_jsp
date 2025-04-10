<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <h3>속성관련 태그 : set, remove ,out 태그</h3>
    <!--  아래 두개는 같은 의미임-->

    <%-- 
<c:set var="test" value="${'Hello JSTL'}" scope="session"></c:set>
    =>SET 태그 : SESSION 영역에 test라는 이름으로 hello jstl 값을 등록
                만약에 속성 parameter가 생략시 기본값 페이지임    
 --%>

    <%
    session.setAttribute("test", "Hello JSTL");
    %>
    test 속성 : ${sessionScope.test}
    <br>
    <!-- 
 out이라는거 쓰는 이유가 뭐임 ? ${test}로도 나오는데
    out 태그 : test 속성값을 화면에 출력 EL과 동일 ${test}와 동일한데 내부적으로는 좀 다른듯
              el보다 보안에 좋다
              excape xml : 
 -->
    test 속성 :
    <c:out value="${test}"></c:out>
    
    <br> test 속성 : ${test}
    <br>
    <!-- 
        remove 태그 : 등록된 속성을 제거 
     -->
    <c:remove var="test"></c:remove>
    test 속성 : ${test}
    <br>
</body>
</html>