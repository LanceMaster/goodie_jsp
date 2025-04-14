<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--/webapp/view/member/loginForm.jsp --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
<form action="login" method="post" name="f" onsubmit="return input_check(this)">
  <table class="table">
    <tr><th>아이디</th><td><input type="text" class="form-control" name="id"></td></tr>
    <tr><th>비밀번호</th><td><input type="password" class="form-control" name="pass"></td></tr>
    <tr class="text-center"><td colspan="2"><button class="btn btn-primary">로그인</button>
      <button type="button" class="btn btn-success" onclick="location.href='joinForm'">회원가입</button>
      <button type="button" class="btn btn-warning" onclick="win_open('idForm')">아이디찾기</button>
      <button type="button" class="btn btn-danger" onclick="win_open('pwForm')">비밀번호찾기</button>
    </td></tr>
  </table></form>
   <script type="text/javascript">
      function input_check(a) {
          if(a.id.value.trim() == "") {
              alert("아이디를 입력하세요")
              a.id.focus();
              return false;
          }
          if(a.pass.value.trim() == "") {
              alert("비밀번호를 입력하세요")
              a.pass.focus();
              return false;
          }
          return true;
      }
      function win_open(page) { //page : idForm
          open(page,"","width=500,height=350,left=50,top=150");
      }
   </script>
 </body></html>