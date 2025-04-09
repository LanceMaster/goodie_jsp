<%@page import="model.member.MemberDAO"%>
<%@page import="model.member.member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /webapp/member/update.jsp 
   1. 모든 파라미터를 Member 객체에 저장하기
   2. 입력된 비밀번호와 db에 저장된 비밀번호 비교.
       관리자인 경우 관리자비밀번호로 비교
       불일치 : '비밀번호 오류' 메세지 출력후 updateForm.jsp 페이지 이동 
   3. Member 객체의 내용으로 db를 수정하기 : boolean MemberDao.update(Member)
       - 성공 : 회원정보 수정 완료 메세지 출력후 info.jsp로 페이지 이동
       - 실패 : 회원정보 수정 실패 메세지 출력 후 updateForm.jsp 페이지 이동     
--%>

<%
request.setCharacterEncoding("UTF-8");
member mem = new member();
mem.setId(request.getParameter("id"));
mem.setName(request.getParameter("name"));
mem.setPass(request.getParameter("pass"));
mem.setGender(Integer.parseInt(request.getParameter("gender")));
mem.setEmail(request.getParameter("email"));
mem.setTel(request.getParameter("tel"));
mem.setPicture(request.getParameter("picture"));

//2. 비밀번호를 위한 db의 데이터조회 : login 정보로 조회하기
String login = (String) session.getAttribute("login");
MemberDAO dao = new MemberDAO();
member dbMem = dao.selectOne(login);
String msg = "비밀번호 오류";
String url = "updateForm.jsp?id=" + mem.getId();
// mem.getPass() : 입력된 비밀번호
// dbMem.getPass() : db에 저장된 비밀번호
System.out.println(mem.getPass());
System.out.println(dbMem.getPass());
System.out.println(mem.getPass().equals(dbMem.getPass()));
if (mem.getPass().equals(dbMem.getPass())) {
	if (dao.update(mem)) { //회원 정보 수정 성공
		System.out.println("성공");
		msg = "수정성공";
		url = "info.jsp?id=" + mem.getId();
	} else {
		msg = "수정실패";
		System.out.println("실패");
	}
}
%>

<script type="text/javascript">
alert("<%=msg%>");
location.href="<%=url%>";
</script>