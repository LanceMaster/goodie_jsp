<%@page import="model.member.MemberDAO"%>
<%@page import="model.member.member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 
1.파라미터값 조회 
2. db에서 입력된 아이디에 해당하는 레코드를 읽어서 Member 객체에 저장 
3. db에서 조회된 내용과 입력된 내용을 비교 
    -->아이디존재 : 없는경우 => 아이디 없음 메세지 출력 . loginForm.jsp로 이동
                 있는경우  => 비밀번호 비교
    --> 비밀번호 일치 : 로그인 성공 => session 로그인 정보 등록 main.jsp로 이동
                 비밀번호 불일치 : 비밀번호가 틀림 => 비밀번호 틀림 메세지 출력 loginForm.jsp로 이동   
 --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <%
    // 1. 파라미터 값 조회
    request.setCharacterEncoding("UTF-8");
    String id = request.getParameter("id");
    String pass = request.getParameter("pass");
    // 2.db에서 등록된 정보 조회
    member mem = new MemberDAO().selectOne(id);
    // 3. 내용 비교
    String msg = "null";
    String url = "loginForm.jsp";
    if (mem == null) {
    	// 아이디 없음
    	msg = "아이디를 확인하세요";
    } else {
    	/* 아이디는 존재하지만 비밀번호가 아직 안한경우  */
    	if (pass.equals(mem.getPass())) {
    		// 비밀번호 일치
    		// 세션에 로그인 정보 등록
    		session.setAttribute("login", id);
            msg = mem.getName() +"님이 로그인 하셨습니다.";
    		url = "main.jsp";
    	} else if (pass.equals("")) {
    		// 비밀번호 입력 안함
    		msg = "비밀번호를 입력하세요";
    	} else {
    		// 비밀번호 틀림
    		msg = "비밀번호를 확인하세요";
    	}
    }
    %>

    <script type="text/javascript">
    alert("<%=msg%>");
    location.href="<%=url%>";
    </script>
</body>
</html>