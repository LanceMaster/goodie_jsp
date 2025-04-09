package model.test0404;

import java.sql.Connection;
import java.sql.PreparedStatement;

import model.member.DBConnection;

public class BookDao {

	public boolean insertBook(Book book) {

		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		String sql = "insert into Book (writer,title,content)" + " values(?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, book.getWriter());
			pstmt.setString(2, book.getTitle());
			pstmt.setString(3, book.getContent());
			
			//추가된 레코드의 건수 리턴. SUCCESS : 1, FAIL : 0
			if (pstmt.executeUpdate() > 0) {
				return true;
			} else {
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
//			자원 반납
			DBConnection.close(conn, pstmt, null);
		}

	}

}
