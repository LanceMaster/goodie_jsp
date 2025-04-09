<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<!-- /contextPath/Root /jspstudy를 쓰면 webapp쪽으로 바로들어감
    http://localhost:8080/jspStudy 
    이클립스 폴더 : /jspStudy/src/main/webapp 폴더를 시작으로 함 
   -->
 <link rel="styleSheet" href="/jspStudy/css/main.css"> 
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
 -->
</head>
<body>

    <%
    /*JDBC DRIVER 클래스 로드  */
    Class.forName("org.mariadb.jdbc.Driver");
    //MariaDB와 연결
    //localhost:3306: : mariadb의 서버 위치
    // gdjdb : mariadb와 연결된 객체
    // conn 객체 : mariadb 와 연결된 객체 
    Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/bigdb", "gduser", "gduser");
    //preparedstatement : Statement의 하위인터페이스
    //statement는 데이터베이스에 문장을 전달하는 기능 객체
    PreparedStatement pstmt = conn.prepareStatement("select * from professor");
    //executeQuery() : 전달된 SQL명령을 실행하여 결과는 resultset 객체로 리턴 
    ResultSet rs = pstmt.executeQuery();
    //ResultSetMetadata : 실행된 결과의 정보데이터를 저장/ 컬럼명 , 조회된 컬럼의 갯수 ..
    ResultSetMetaData rsmt = rs.getMetaData();
    %>
    <table>
        <tr>
            <%
            for (int i = 1; i <= rsmt.getColumnCount(); i++) {
            %>
            <th><%=rsmt.getColumnName(i)%></th>
            <%
            }
            %>
        </tr>

        <%
        while (rs.next()) {
        %><tr>
            <%
            for (int i = 1; i <= rsmt.getColumnCount(); i++) {
            %>
            <td><%= rs.getString(i) %></td>
            <%} %>
        </tr>
        <%}%>
    </table>

</body>
</html>