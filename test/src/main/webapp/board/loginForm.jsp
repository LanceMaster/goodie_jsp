<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>로그인창</title>
  </head>
  <body>
    <div class="login-container">
      <h1 class="login-title">로그인</h1>
      <form action="loginProcess.jsp" method="post">
        <div class="input-group">
          <input type="text" id="id" name="id" required />
          <label for="id">아이디</label>
        </div>
        <div class="input-group">
          <input type="password" id="password" name="password" required />
          <label for="password">비밀번호</label>
        </div>
        <button type="submit" class="login-btn">로그인</button>
        <div class="links">
          <a href="findId.jsp">아이디 찾기</a>
          <a href="findPassword.jsp">비밀번호 찾기</a>
          <a href="join.jsp">회원가입</a>  
        </div>
      </form>
    </div>
  </body>
</html>
