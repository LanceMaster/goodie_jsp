<%@page import="model.member.MemberDAO"%>
<%@page import="model.member.member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
    =>joinForm.jsp 에서 입력된 값을 database member 테이블에 등록하기
    1. 파라미터 값을 Member 클래스 객체에 저장
    2. Member 객체를 db에 insert 하기
    3. 회원가입 성공 :loginForm.jsp로 이동을 할거다.
       회원가입 실패 : joinForm.jsp로 이동을 할거다.
       
 --%>
<%
 request.setCharacterEncoding("UTF-8");
  // Member 클래스 : 파라미터의 갯수와 같은 프로퍼티를 가진 Bean 클래스
  // DTO : 데이터를 DB에 전달하기 위한 객체
  member mem = new member(); 
  // request.getParameter("id") : <input type="text" name="id">의 name 속성값
  /**
  직접 member객체에 private으로 접근은 안되지만 get으로 접근이 가능하다.
  */
  mem.setId(request.getParameter("id"));
  mem.setPass(request.getParameter("pass"));
  mem.setName(request.getParameter("name"));
  //i여서 Integer.parseInt 사용
  mem.setGender(Integer.parseInt(request.getParameter("gender")));
  mem.setTel(request.getParameter("tel"));
  mem.setEmail(request.getParameter("email"));
  mem.setPicture(request.getParameter("picture"));
  /**
    => mem 객체는 joinForm.jsp 페이지에서 입력한 값을 저장하고 있는 객체.
  */
  
  
  
   // 2. member 객체를 db에 insert 하기
   MemberDAO dao = new MemberDAO();
   String msg = "회원가입 실패";
   String url = "joinForm.jsp";
   // boolean result = false; 
   //insert(member) 메소드의 리턴값을 result에 저장
   if(dao.insertMember(mem)) {
       msg = "회원가입 성공";
       url = "loginForm.jsp";
   }
 %>

<%-- 3 --%>
<script type="text/javascript">

     // alert() : 경고창을 띄우는 메소드
     // location.href : 페이지 이동을 위한 속성
     alert("<%=msg%>");
     location.href="<%=url%>";
 </script>
