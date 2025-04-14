<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
</head>
<body>
<div class="container">
    <div class="form-container join-container">
        <h2 class="form-title">회원가입</h2>
        <form action="join" method="post" name="f" enctype="multipart/form-data" class="form">
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
            <div class="form-group">
                <label for="name">이름</label>
                <input type="text" id="name" name="name" maxlength="20" placeholder="이름을 입력하세요">
                <div class="error-message" id="name-error"></div>
            </div>
            <div class="form-group">
                <label for="gender">성별</label>
                <div class="radio-group">
                    <label>
                        <input type="radio" name="gender" value="1" checked> 남자
                    </label>
                    <label>
                        <input type="radio" name="gender" value="2"> 여자
                    </label>
                </div>
            </div>
            <div class="form-group">
                <label for="tel">전화번호</label>
                <input type="tel" id="tel" name="tel" maxlength="20" placeholder="전화번호를 입력하세요">
                <div class="error-message" id="tel-error"></div>
            </div>
            <div class="form-group">
                <label for="email">이메일</label>
                <input type="email" id="email" name="email" maxlength="50" placeholder="이메일을 입력하세요">
                <div class="error-message" id="email-error"></div>
            </div>
            <div class="form-group">
                <label for="picture">프로필 사진</label>
                <div class="profile-image-container">
                    <img src="" id="pic" class="profile-image">
                    <button type="button" class="button secondary" onclick="win_upload()">사진 등록</button>
                </div>
                <input type="hidden" id="picture" name="picture" value="">
            </div>
            <div class="button-group">
                <button type="submit" class="button primary">회원가입</button>
                <button type="button" class="button secondary" onclick="location.href='${pageContext.request.contextPath}/board/loginForm.jsp'">취소</button>
            </div>
        </form>
    </div>
</div>

<script type="text/javascript">
    function input_check(f) {
        let isValid = true;
        
        // 아이디 체크
        if (f.id.value.trim() === "") {
            document.getElementById('id-error').style.display = 'block';
            document.getElementById('id-error').textContent = '아이디를 입력하세요';
            f.id.focus();
            isValid = false;
        } else {
            document.getElementById('id-error').style.display = 'none';
        }

        // 비밀번호 체크
        if (f.pass.value.trim() === "") {
            document.getElementById('pass-error').style.display = 'block';
            document.getElementById('pass-error').textContent = '비밀번호를 입력하세요';
            f.pass.focus();
            isValid = false;
        } else {
            document.getElementById('pass-error').style.display = 'none';
        }
        
        // 이름 체크
        if (f.name.value.trim() === "") {
            document.getElementById('name-error').style.display = 'block';
            document.getElementById('name-error').textContent = '이름을 입력하세요';
            f.name.focus();
            isValid = false;
        } else {
            document.getElementById('name-error').style.display = 'none';
        }
        
        return isValid;
    }

    function win_upload() {
        const op = "width=500, height=150, left=150, top=150";
        window.open("${pageContext.request.contextPath}/member/pictureForm.jsp", "", op);
    }

    function setPicture(pic) {
        document.getElementById('pic').src = pic;
        document.getElementById('picture').value = pic;
    }
</script>
</body>
</html>