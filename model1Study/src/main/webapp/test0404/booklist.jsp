<%@page import="model.member.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book List</title>
<link rel="stylesheet" type="text/css" href="../css\main.css">
</head>
<body>

    <script type="text/javascript">
					function newBook() {
						console.log("새로 만들기 버튼 클릭");
						location.href = "bookInsert.jsp";
					}
				</script>
    <h1>Book List</h1>
    <button type="button" onclick="newBook()"
        style="margin: 10px; padding: 10px;">새로만들기</button>
    <table border="1">
        <tr>
            <th>BookNo</th>
            <th>Writer</th>
            <th>Title</th>
            <th colspan="2">Content</th>
        </tr>
        <%
        /*  String url = "jdbc:mariadb://localhost:3306/bigdb";
         String user = "gduser";
         String password = "gduser";
         */
         /* Connection con = DBCONNECTION.GETCONNECTION 1. DB 연결 */
         /*sql 2. SQL문 작성 */
         /*conn.preparedStatement 3. SQL문 실행 */
         /* RESULT SET 4. 결과값 처리 */
        Connection conn = DBConnection.getConnection();
        String sql = "SELECT * FROM book";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        ResultSet rs = null;

        try {
            /* pstmt.excuteQuerye()로 해당 쿼리 결과값  */
        	rs = pstmt.executeQuery();

        	while (rs.next()) {
        		String writer = rs.getString("Writer");
        		String title = rs.getString("Title");
        		String content = rs.getString("Content");
                int bookNo = rs.getInt("BookNo");
        %>
        <tr>
            <td><%=bookNo%></td>
            <td><%=writer%></td>
            <td><%=title%></td>
            <td><%=content%></td>
            <td>
                <%-- <button type="button" onclick="location.href='bookupdate.jsp?writer=<%= writer %>&title=<%= title %>'">수정</button> --%>
                <button type="button"
                    onclick="location.href='bookdelete.jsp?writer=<%=writer%>&title=<%=title%>'">삭제</button>
            </td>
        </tr>
        <%
        }
        } catch (Exception e) {
        e.printStackTrace();
        } finally {
        if (rs != null)
        try {
        	rs.close();
        } catch (SQLException e) {
        	e.printStackTrace();
        }
        if (pstmt != null)
        try {
        	pstmt.close();
        } catch (SQLException e) {
        	e.printStackTrace();
        }
        if (conn != null)
        try {
        	conn.close();
        } catch (SQLException e) {
        	e.printStackTrace();
        }
        }
        %>
    </table>
</body>
</html>
