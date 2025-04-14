<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet"
    href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet"
    href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <form action="password" method="post" name="f"
        onsubmit="input_check(this)">
        <table class="table">
            <h3 align="center">비밀번호 변경</h3>
            <tr>
                <th>현재 아이디</th>
                <td><input type="text" name="id" required /></td>
            </tr>
            <tr>
                <th>현재 비밀번호</th>
                <td><input type="password" name="old_password"
                    required class="form-control" /></td>
            </tr>
            <tr>
                <th>새로운 비밀번호</th>
                <td><input type="password" name="new_password"
                    required class="form-control" /></td>
            </tr>
            <tr>
                <th>새로운 비밀번호 확인</th>
                <td><input type="password" name="new_password2"
                    required class="form-control" /></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit"
                    class="btn btn-primary" value="비밀번호 변경" style="align-items: center;"/>
                <input type="reset"
                    class="btn btn-secondary"></td>

            </tr>
        </table>


    </form>

    <script type="text/javascript">
					function input_check(f) {
						if (f.new_password.value != f.new_password2.value) {
							alert(f.old_password.value);
							alert(f.new_password.value);
							alert("새로운 비밀번호와 확인 비밀번호가 일치하지 않습니다.");
							f.new_password.value = "";
							f.new_password2.value = "";
							f.new_password.focus();
							return false;
						}
						return true;
					}
				</script>
</body>
</html>