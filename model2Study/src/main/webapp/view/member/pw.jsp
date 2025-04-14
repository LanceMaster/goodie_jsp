<%@page import="model.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- 
    1.파라미터 id email tel 저장 
    2. db에서 id ,email과 tel 을 이용하여 
        해당 계정이 있는지 확인하기? pass값이 있는지
    3. 없으면 없다 다음에 pwForm.jsp로 이동 
       있으면 앞 두자리는 **로 표시하여 화면에 출력 닫기버튼 클릭시 현재버튼 닫기

--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <table>
        <tr>
            <td><c:choose>
                    <c:when test="${empty pass}">비밀번호가 없습니다.</c:when>
                    <c:when test="${not empty pass}">
             회원님의 비밀번호는 ${pass }입니다.<br>
                    </c:when>
                </c:choose></td>
        </tr>
        <tr>
            <td colspan="2"><input type="button" value="닫기"
                onclick="pwClose()"></td>
        </tr>
    </table>
    <script type="text/javascript">
					function pwClose() {
					    self.close();
					}
				</script>
</body>
</html>
