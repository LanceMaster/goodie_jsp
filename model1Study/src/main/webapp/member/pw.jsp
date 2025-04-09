<%@page import="model.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 
    1.파라미터 id email tel 저장 
    2. db에서 id ,email과 tel 을 이용하여 
        해당 계정이 있는지 확인하기? pass값이 있는지
    3. 없으면 없다 다음에 pwForm.jsp로 이동 
       있으면 앞 두자리는 **로 표시하여 화면에 출력 닫기버튼 클릭시 현재버튼 닫기

--%>

<%
/*파라미터값 받기  */
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");
String email = request.getParameter("email");
String tel = request.getParameter("tel");

String pw = new MemberDAO().pwSearch(id, email, tel);
/** 
case 1 : 맞는 password가 없을떄
*/
String url = null;
String msg = null;
if (pw == null) {
	msg = "정보에 맞는 비밀번호를 찾을수 없습니다.";
	url = "pwForm.jsp";
%>
<script type="text/javascript">
	alert("해당 되는 비밀번호가 없습니다.");
	location.href = "pwForm.jsp";
</script>

<%
} else {
%>
<%
pw = "**" + pw.substring(2);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <table>
        <tr>
            <th>비밀번호</th>
            <td><%=pw%></td>
        </tr>
        <tr>
            <td colspan="2"><input type="button" value="닫기"
                onclick="pwClose()"></td>
        </tr>
    </table>
    <script type="text/javascript">
					function pwClose() {
					    self.close();
					}
				</script>
</body>
</html>
<%
}
%>