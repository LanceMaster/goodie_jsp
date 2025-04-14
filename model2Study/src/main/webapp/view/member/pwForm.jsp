<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%-- /webapp/member/pwForm.jsp--%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>비밀번호찾기</title>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  </head>
  <body>
    <h3 align="center">비밀번호찾기</h3>
    <form action="pw" method="post">
      <table class="table">
        <tr>
          <th>아이디</th>
          <td><input type="text" name="id" required class="form-control" /></td>
        </tr>
        <tr>
          <th>이메일</th>
          <td><input type="email" name="email" required class="form-control" /></td>
        </tr>
        <tr>
          <th>전화번호</th>
          <td><input type="tel" name="tel" required class="form-control"/></td>
        </tr>
        <tr>
          <td colspan="2">
            <input type="submit" class="btn btn-success" value="비밀번호찾기" />
          </td>
        </tr>
      </table>
    </form>

    <script type="text/javascript">
      function checkValue() {
        if (!document.newMember.id.value) {
          alert("아이디를 입력하세요.");
          return false;
        }
        if (!document.newMember.email.value) {
          alert("이메일을 입력하세요.");
          return false;
        }
        if (!document.newMember.tel.value) {
          alert("전화번호를 입력하세요.");
          return false;
        }

        return true;
      }
      function isVaildEmail(email) {
        // 이메일 정규표현식 테스트
        /**
         * [a-zA-Z] : 영문자 한개
         * [0-9] : 숫자 한개
         * [-_.] : 문자 한개
         * ? : 0개 또는 1개
         * * : 0개 이상
         * @ : 이메일 아이디와 도메인 구분
         * \. : 도메인 구분
         * {2,3} : 2개 또는 3개
         * $ : 문자열 끝
         * i : 대소문자 구분 없음
         */
        // [a-zA-Z][2,] => 소문자 또는 대문자 2개 이상
        
        var emailReg =
          /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
        return emailReg.test(email); //정규표현식 일치 : TRUE리턴 불일치 FALSE리턴
      }
    </script>
  </body>
</html>
