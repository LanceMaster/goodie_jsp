<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 보기</title>
</head>
<body>
    <%
    List<String> cart = (List<String>) session.getAttribute("cart");
    /*     Map<String, Integer> cart2 = (Map<String, Integer>) session.getAttribute("cart");
     */

    if (cart == null || cart.size() == 0) {
    %>
    <h3>장바구니에 상품이 없다</h3>
    <%
    } else {
    %>
        <h3> 장바구니 상품</h3>
    <%
    for (String p : cart) {
    %>
   <h4><%=p%></h4> 
    <%
    }
    %>
    <%
    /* 현재 세션 종료하기  */
     session.invalidate();  
     
/*      session.removeAttribute("cart");
 */    }
    %>


</body>
</html>