<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>메일 작성</title>
            <script type="text/javascript">
                function input_check(f) {
                    if (f.googleid.value.trim() == "") {
                        alert("구글 아이디를 입력하세요.");
                        f.googleid.focus();
                        return false;
                    }
                    if (f.googlepw.value.trim() == "") {
                        alert("내용을 입력하세요");
                        f.googlepw.focus();
                        return false;
                    }
                    return true;
                }
            </script>
        </head>

        <body>
            <div class="container">
                <h2>메일 작성</h2>
                <form name="form1" method="post" action="mailSend" onsubmit="return inputchk(this)">
                    <table class="table table-bordered">
                        <tr>
                            <th>보내는 사람</th>
                            <td><input type="text" name="googleid" maxlength="20" class="form-control" value="ukirrer" readonly="readonly"></td>
                        </tr>
                        <tr>
                            <th>구글 비밀번호</th>
                            <td><input type="password" name="googlepw" maxlength="20" class="form-control" value="lezhtxfaesthgzoj" readonly="readonly"></td>
                        </tr>
                        <tr>
                            <th>받는사람</th>
                            <%--
                                수신자 목록 형태
                                테스트1 <테스트1의 이메일>
                                위의 형식대로 하면 이름이 나오고 이름에 해당되는 메일이 나옴
                            --%>
                            <td><input type="text" name="recipient" class="form-control" value="<c:forEach var='m' items='${list}' varStatus='loop'>
    ${m.name} <${m.email}><c:if test='${!loop.last}'>,</c:if>
</c:forEach>
                        " readonly="readonly"></td>
                        </tr>
                        <tr>
                            <th>제목</th>
                            <td><input type="text" name="title" class="form-control"></td>
                        </tr>
                        <tr>
                            <th>메세지 형식</th>
                            <td><select name="mtype" class="form-control">
                             <!-- text/html utf-8 
                             html태그를 인식하는 메일형식 
                             -->   
                            <option value="text/html;charset=UTF-8">HTML</option>
                            <!-- 
                                html태그를 인식하지 않는 메일형식
                                메일 본문에 html태그가 들어가면 태그가 보임
                            -->
                            <option value="text/plain;charset=UTF-8">TEXT</option>
                    </select></td>
                        </tr>
                        <tr>
                            <td colspan="2"><textarea id="summernote" name="content" class="form-control" cols="40" rows="10"></textarea></td>
                        </tr>
                        <tr>
                            <td colspan="2" class="text-right">
                                <button type="reset" class="btn btn-primary">
                            초기화</button>
                                <button type="submit" class="btn btn-dark">전송</button>
                            </td>
                    </table>
                </form>
        </body>

        </html>