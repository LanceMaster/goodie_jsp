<%@page import="model.member.MemberDAO"%>
<%@page import="model.member.member"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /webapp/member/list.jsp
   1. admin으로 로그인 된경우만 조회 가능
   2. db에서 모든 회원목록을 조회하여 List<Member> 객체로 리턴  
--%>
<%
String login = (String) session.getAttribute("login");
if (login == null || login.equals("")) {
%>
<script>
	alert("로그인 하세요");
	location.href = "loginForm.jsp";
</script>
<%
} else if (!login.equals("admin")) {
%>
<script>
	alert("관리자만 거래 가능합니다.");
	location.href = "main.jsp";
</script>
<%
} else {
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록</title>
<link rel="stylesheet" href="../css/main.css">
<style>
    .search-container {
        margin: 20px 0;
        padding: 15px;
        background-color: #f5f5f5;
        border-radius: 5px;
    }
    .search-form {
        display: flex;
        gap: 10px;
        align-items: center;
    }
    .search-form select, .search-form input {
        padding: 8px;
        border: 1px solid #ddd;
        border-radius: 4px;
    }
    .search-form button {
        padding: 8px 15px;
        background-color: #4CAF50;
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }
    .search-form button:hover {
        background-color: #45a049;
    }
    .member-table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }
    .member-table th, .member-table td {
        padding: 12px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }
    .member-table th {
        background-color: #f2f2f2;
    }
    .member-table tr:hover {
        background-color: #f5f5f5;
    }
    .action-links a {
        margin-right: 10px;
        text-decoration: none;
        color: #333;
    }
    .action-links a:hover {
        color: #4CAF50;
    }
</style>
</head>
<body>
    <div class="search-container">
        <form class="search-form" action="list.jsp" method="get">
            <select name="searchType">
                <option value="id">아이디</option>
                <option value="name">이름</option>
                <option value="tel">전화번호</option>
            </select>
            <input type="text" name="searchValue" placeholder="검색어를 입력하세요">
            <button type="submit">검색</button>
        </form>
    </div>

    <table class="member-table">
        <caption>회원목록</caption>
        <tr>
            <th>아이디</th>
            <th>사진</th>
            <th>이름</th>
            <th>성별</th>
            <th>전화</th>
            <th>관리</th>
        </tr>
        <%
        String searchType = request.getParameter("searchType");
        String searchValue = request.getParameter("searchValue");
        List<member> list;
        
        if (searchType != null && searchValue != null && !searchValue.trim().equals("")) {
            list = new MemberDAO().searchList(searchType, searchValue);
        } else {
            list = new MemberDAO().list();
        }
        
        for (member m : list) {
        %>
        <tr>
            <td><a href="info.jsp?id=<%=m.getId()%>"><%=m.getId()%></a></td>
            <td><img src="picture/<%=m.getPicture()%>" width="30" height="30"></td>
            <td><%=m.getName()%></td>
            <td><%=m.getGender() == 1 ? "남" : "여"%></td>
            <td><%=m.getTel()%></td>
            <td class="action-links">
                <a href="updateForm.jsp?id=<%=m.getId()%>">수정</a>
                <% if (!m.getId().equals("admin")) { %>
                <a href="deleteForm.jsp?id=<%=m.getId()%>">강제탈퇴</a>
                <% } %>
            </td>
        </tr>
        <% } %>
    </table>
</body>
</html>
<%
}
%>