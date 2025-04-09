<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="../css/main.css">
</head>
<body>
    <%--
    onsubmit : form이 submit될 때 호출되는 이벤트
    return input_check(this) : input_check()함수를 호출.매개변수 this(현재 form)을 넘겨줌


 --%>

    <form action="join.jsp" name="f" method="post"
        onsubmit="return input_check(this)">
        <input type="hidden" name="picture" value="">
        <table width="500" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td rowspan="4" ailign="bottom"><img src=""
                    width="100" height="100" id="pic"> <br> <font
                    size="1"><a href="javascript:win_upload()">사진등록</a></font>
                </td>
                <th>아이디</th>
                <td><input type="text" name="id"></td>
            </tr>
            <tr>
                <th>비밀번호</th>
                <td><input type="password" name="pass"></td>
            </tr>
            <tr>
                <th>이름</th>
                <td><input type="text" name="name"></td>
            </tr>
            <tr>
                <th>성별</th>
                <td><label for="gender1">남</label> <input
                    type="radio" id="gender1" name="gender" value="1">
                    <label for="gender2">여</label> <input type="radio"
                    id="gender2" name="gender" value="2"></td>
            </tr>
            <tr>
                <th>전화번호</th>
                <td colspan="2"><input type="text" name="tel">
                </td>
            </tr>
            <tr>
                <th>이메일</th>
                <td colspan="2"><input type="text" name="email">
                </td>
            </tr>
            <tr>
                <td colspan="3" align="center">
                <%-- button 태그의 기본 type은 submit임. --%>
                    <button type="submit">회원가입</button>
                </td>
            </tr>

        </table>
    </form>
    <script type="text/javascript">
					function input_check(f) {
						/* this를 받는얘는 f이다.
						   f.id : <input type="text" name="id"> name 속성값의 id값을 가져옴
						*/
						// f.id.value : form의 id속성값을 가져옴
						// trim() : 공백을 제거하는 메소드
						// value.trim() : 공백을 제거한 후 값이 있는지 체크
						if (f.id.value.trim() == "") {
							alert("아이디를 입력하세요");
							f.id.focus();
							return false;
						}
						// 비밀번호 체크
						if (f.pass.value.trim() == "") {
							alert("비밀번호를 입력하세요");
							f.pass.focus();
							return false;
						}
						// 이름 체크
						if (f.name.value.trim() == "") {
							alert("이름을 입력하세요");
							f.name.focus();
							return false;
						}
					    /*
					    위의 3가지의 값이 모두 입력되었을 때
					    join.jsp로 이동
					    */
						return true;
					}
					
					function win_upload() {
						let op = "width=500,height=500,left=50,top=150";
						open("pictureForm.jsp","",op);
					}
				</script>
</body>
</html>