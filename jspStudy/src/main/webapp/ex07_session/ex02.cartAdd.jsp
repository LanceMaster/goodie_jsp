<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <%
    request.setCharacterEncoding("UTF-8");
    String item = request.getParameter("product");

    /* Map<String, Integer> cart = (Map<String, Integer>) session.getAttribute("cart");
     */
    List<String> cart = (List<String>) session.getAttribute("cart");
     /* 맨처음에는 무조건 null값이 나옴   */
    if (cart == null) {
    	cart = new ArrayList<String>();
    	/* cart = new HashMap<String, Integer>(); */
    	session.setAttribute("cart", cart);
    }

    cart.add(item);
     System.out.println(cart);
    /*  if (cart.containsKey(item)) {
     	cart.put(item, cart.get(item) + 1);
     } else {
     	cart.put(item, 1);
     }
    */
    %>

<script type="text/javascript">
alert('<%=item%>이 추가 되었습니다.');
history.go(-1); /* 앞페이지로 가기  */
</script>
</body>
</html>