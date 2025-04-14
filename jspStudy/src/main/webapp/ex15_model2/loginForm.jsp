<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

<!-- 상대경로 대신 절대경로 또는 올바른 상대경로 확인 -->
</head>
<body>

<div class="container">
    <form action="login.jsp" method="post" name="f" onsubmit="return input_check(this)">
        <table>
            <caption>로그인</caption>
            <tr>
                <th>아이디</th>
                <td><input type="text" name="id" maxlength="20"></td>
            </tr>
            <tr>
                <th>비밀번호</th>
                <td><input type="password" name="pass" maxlength="20"></td>
            </tr>
            <tr>
                <td colspan="2">
                    <button class="button" type="submit">로그인</button>
                    <button class="button" type="button" onclick="location.href='joinForm.jsp'">회원가입</button>
                    <button class="button" type="button" onclick="win_open('idForm')">아이디 찾기</button>
                    <button class="button" type="button" onclick="win_open('pwForm')">비밀번호 찾기</button>
                </td>
            </tr>
        </table>
    </form>
</div>

<script type="text/javascript">
    function input_check(f) {
        if (f.id.value.trim() == "") {
            alert("아이디를 입력하세요");
            f.id.focus();
            return false;
        }
        if (f.pass.value.trim() == "") {
            alert("비밀번호를 입력하세요");
            f.pass.focus();
            return false;
        }
        return true;
    }

    function win_open(url) {
        window.open(url + ".jsp", "new", "width=400,height=300");
    }
</script>

</body>
</html>
