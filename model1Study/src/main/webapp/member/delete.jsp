<%@page import="model.member.MemberDAO"%>
<%@page import="model.member.member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- 2개의 파라미터값 저장 --%>
<%
String id = request.getParameter("id");
String password = request.getParameter("pass");
String login = (String)session.getAttribute("login");

%>

<!--  로그인 정보 검증 -->

<%
String msg = null;
String url = null;
if(login == null) {
    msg = "로그인하세요"; %>

<script type="text/javascript">
alert("<%=msg%>");
location.href = "loginForm.jsp";
</script>
<%    
} else if(!login.equals(id) && !login.equals("admin")) {
%>
<script type="text/javascript">
alert("자기만 로그인 가능함");
</script>

<% } else if(id.equals("admin")) {
    msg = "관리자는 탈퇴가 불가능";
    url = "list.jsp";
%>
<%
} else {
    MemberDAO memberdao = new MemberDAO();
    member dbMem = memberdao.selectOne(id);
    if(password.equals(dbMem.getPass())) {
        //비밀번호가 일치하는경우
        //탈퇴성공시
        if(memberdao.delete(id)) {
          msg = id +"님 탈퇴 완료";
          if(login.equals("admin")) {
           url = "list.jsp";   
          } else {
            /*로그아웃 먼저 시킴  */
            session.invalidate();
            url = "loginForm.jsp";
          }
        } else {
         /* 탈퇴 실패시  */   
            msg = id + "탈퇴 실패";
            if(login.equals("admin")) {
                url = "list.jsp";
            } else {
               url = "main.jsp";   
            }
        }
    } else { //비밀번호 오류시
        msg = "비밀번호가 틀립니다.";
        url = "deleteForm.jsp?id="+id;
    }
%>
<%
}
%>
<script type="text/javascript">
alert("<%=msg %>");
location.href="<%=url%>";
</script>
