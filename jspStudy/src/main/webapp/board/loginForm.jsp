<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
</head>
<body>
<div class="container">
    <div class="form-container login-container">
        <h2 class="form-title">로그인</h2>
        <form action="${pageContext.request.contextPath}/board/login" method="post" name="f" onsubmit="return input_check(this)" class="form">
            <div class="form-group">
                <label for="id">아이디</label>
                <input type="text" id="id" name="id" maxlength="20" placeholder="아이디를 입력하세요">
                <div class="error-message" id="id-error"></div>
            </div>
            <div class="form-group">
                <label for="pass">비밀번호</label>
                <input type="password" id="pass" name="pass" maxlength="20" placeholder="비밀번호를 입력하세요">
                <div class="error-message" id="pass-error"></div>
            </div>
            <div class="button-group">
                <button type="submit" class="button primary">로그인</button>
                <button type="button" class="button secondary" onclick="location.href='${pageContext.request.contextPath}/member/joinForm.jsp'">회원가입</button>
                <button type="button" class="button secondary" onclick="win_open('${pageContext.request.contextPath}/member/idForm')">아이디 찾기</button>
                <button type="button" class="button secondary" onclick="win_open('${pageContext.request.contextPath}/member/pwForm')">비밀번호 찾기</button>
            </div>
        </form>
    </div>
</div>

<script type="text/javascript">
    function input_check(f) {
        if (f.id.value.trim() == "") {
            document.getElementById('id-error').style.display = 'block';
            document.getElementById('id-error').textContent = '아이디를 입력하세요';
            f.id.focus();
            return false;
        } else {
            document.getElementById('id-error').style.display = 'none';
        }
        
        if (f.pass.value.trim() == "") {
            document.getElementById('pass-error').style.display = 'block';
            document.getElementById('pass-error').textContent = '비밀번호를 입력하세요';
            f.pass.focus();
            return false;
        } else {
            document.getElementById('pass-error').style.display = 'none';
        }
        
        return true;
    }

    function win_open(url) {
        window.open(url + ".jsp", "new", "width=400,height=300");
    }
</script>
</body>
</html> 