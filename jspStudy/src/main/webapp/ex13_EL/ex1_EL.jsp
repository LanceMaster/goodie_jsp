<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!-- 
    /webapp/ex13_EL/ex1_EL.jsp
    -->
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
  </head>
  <body>
    <% String tel = "010-1234-5678"; pageContext.setAttribute("tel",tel);
    pageContext.setAttribute("test","pageContext의 test영역");
    request.setAttribute("test","request의 test 속성");
    session.setAttribute("test","session의 test 속성");
    application.setAttribute("test","application의 test 속성"); %>

    <h3>JSP와 스크립트를 이용하여 파라미터와 속성값 출력하기</h3>

    pageContext tel 속성 값 : <%=pageContext.getAttribute("tel") %> <br />

    pageContext test 속성 값 : <%=pageContext.getAttribute("test") %> <br />

    request test 속성 값 : <%= request.getAttribute("test") %> <br />

    session test 속성 값 : <%= session.getAttribute("test") %> <br />

    application 속성 값 : <%= application.getAttribute("test") %> <br />

    id 파라미터 : <%= request.getParameter("id") %> <br />

    없는 속성 : <%= request.getAttribute("noattr") %> <br />

    없는 파라미터 : <%= request.getParameter("noparam") %> <br />

    <h3>JSP의 EL을 이용하여 파라미터와 속성값 출력하기</h3>

    pageContext tel 속성 값 : ${pageScope.tel} <br />

    pageContext test 속성 값 : ${pageScope.test} <br />

    request test 속성 값 : ${requestScope.test} %> <br />

    session test 속성 값 : ${sessionScope.test} <br />

    application 속성 값 : ${applicationScope.test} <br />

    PageContext tel 속성값 : ${pageScope.test}<br />

    id 파라미터 : ${param.id}<br />

    없는 속성 : ${requestScope.noattr}<br />

    없는 파라미터 : ${param.noattr} <br />

    <h3>영역을 표시하여 속성 출력</h3>

    \${test} : ${test } <br>
    \${pageScope.test} : ${pageScope.test} <br>
    \${requestScope.test} : ${requestScope.test} <br>
    \${sessionScope.test} : ${sessionScope.test} <br>
    \${applicationScope.test} : ${applicationScope.test} 
    
    

    <!-- 
    
    ${test} : 영역담당 객체에 등록된 속성 중 이름이 test인 속성 값을 출력 
    우선순위
    1. Page 영역에 등록된 pageScope.test 속성 값 출력
    2. 1번이 없으면 REQUEST 영역에 등록된 requestScore.test 속성 값 출력 
    3. 2번이 없으면 session 영역에 등록된 sessionScope.test 속성 값 출력
    4. 3번이 없으면 application 영역에 등록된 application.test 속성 값 출력
    5. 1 ~ 4 내용이 없으면 공란을 출력
    ${영역객체.test} : 영역객체에 등록된 속성 중 이름이 test인 속성값을 출력
    1. 해당 영역에 등록된 속성이 없으면 공란을 출력
    
    -->
  </body>
</html>
