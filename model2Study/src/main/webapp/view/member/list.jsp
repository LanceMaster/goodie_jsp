<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록</title>
</head>
<body>
    <div class="container my-5">
        <div class="card shadow">
            <div class="card-header bg-dark text-white">
                <h3 class="mb-0">회원목록</h3>
            </div>
            <div class="card-body">
                <form name="f" method="post" action="mailForm"
                    onsubmit="return input_check(this)">
                    <div class="table-responsive">
                        <table
                            class="table table-bordered table-hover table-striped text-center align-middle">
                            <thead class="table-dark">
                                <tr>
                                    <th>아이디</th>
                                    <th>사진</th>
                                    <th>이름</th>
                                    <th>성별</th>
                                    <th>전화</th>
                                    <th>관리</th>
                                    <th><input type="checkbox"
                                        name="alchk"
                                        onchange="allchkbox(this)">
                                        전체선택</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="m" items="${list}">
                                    <tr>
                                        <td><a
                                            href="info?id=${m.id}">${m.id}</a></td>
                                        <td><img
                                            src="../picture/${m.picture}"
                                            class="img-thumbnail"
                                            width="40" height="40"
                                            alt="사진"></td>
                                        <td>${m.name}</td>
                                        <td>${m.gender == 1 ? "남" : "여"}</td>
                                        <td>${m.tel}</td>
                                        <td><a
                                            href="updateForm?id=${m.id}"
                                            class="btn btn-sm btn-outline-primary me-1">수정</a>
                                            <c:if
                                                test="${m.id != 'admin'}">
                                                <a
                                                    href="deleteForm?id=${m.id}"
                                                    class="btn btn-sm btn-outline-danger">강제탈퇴</a>
                                            </c:if></td>
                                        <td><input type="checkbox"
                                            name="idchks"
                                            class="form-check-input idchk"
                                            value="${m.id}"></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="text-center mt-3">
                        <button type="submit" class="btn btn-dark">메일
                            보내기</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- JavaScript -->
    <script>
    function input_check(f) {
        let cnt = 0;
        document.querySelectorAll(".idchk").forEach((idchk) => {
            if (idchk.checked) cnt++;
        });
        if (cnt == 0) {
            alert("이메일 전송 아이디를 선택하세요");
            return false;
        }
        return true;
    }

    function allchkbox(chk) {
        document.querySelectorAll(".idchk").forEach((idchk) => {
            idchk.checked = chk.checked;
        });
    }
</script>
</body>
</html>
