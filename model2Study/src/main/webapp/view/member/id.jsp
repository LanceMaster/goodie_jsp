<%@page import="model.member.MemberDAO"%> <%@ page language="java"
contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%-- 1.파라미터값
(email,tel) 저장 2.db에서 두개의 파라미터를 이용하여 id값을 리턴해주는 함수 id
Memberdao.idSearch(eamil,tel) 3. id 존재 : 화면 뒤쪽 2자리를 **표시하여 화면에
출력하기 아이디 전송 버튼을 클릭하면 opener 창에 id 입력란에 전달, id.jsp 화면을
닫기 id 없음 : id가 없습니다. 현재 화면을 idForm.jsp 페이지로 이동 --%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
  </head>
  <body>
    <table>
      <tr>
        <th>아이디</th>
        <td>${id}</td>
      </tr>
      <tr>
        <td colspan="2">
          <input type="button" value="아이디전송" onclick="idsend('${id}')" />
        </td>
      </tr>
    </table>
    <script type="text/javascript">
      /* 맨뒤글자 **빼고 출력하기  */
      /*opener : loginform.jsp  */
      //loginForm.jsp 페이지에 id값 입력
      function idsend(id) {
    	  console.log(id);
    	  console.log(opener.document.f);
        opener.document.f.id.value = id;
        self.close();
      }
    </script>
  </body>
</html>
