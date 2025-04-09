package model.member;

import java.lang.reflect.Member;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MemberDAO {

	public boolean insertMember(member mem) {
		// TODO Auto-generated method stub
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		String sql = "insert into member (id,pass,name,gender,tel,email,picture)" + " values(?,?,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
//			mem.getid() : join.jsp에서 아이디로 입력된 값
			pstmt.setString(1, mem.getId());
			// mem.getpass() : join.jsp에서 비밀번호로 입력된 값
			pstmt.setString(2, mem.getPass());
			// mem.getname() : join.jsp에서 이름으로 입력된 값
			pstmt.setString(3, mem.getName());
			// mem.getgender() : join.jsp에서 성별로 입력된 값(gender db를 만들었을때 gender type을 int로
			// 만들어놨다리)
			pstmt.setInt(4, mem.getGender());
			// mem.gettel() : join.jsp에서 전화번호로 입력된 값
			pstmt.setString(5, mem.getTel());
			// mem.getemail() : join.jsp에서 이메일로 입력된 값
			pstmt.setString(6, mem.getEmail());
			// mem.getpicture() : join.jsp에서 사진으로 입력된 값 (사진 이미지의 이름이 들어온다)
			pstmt.setString(7, mem.getPicture());
			if (pstmt.executeUpdate() > 0) {
				return true;
			} else {
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
//			true로 해도 finally가 실행이 된다.
		} finally {
//			pstmt를 닫고 conn을 닫는다.preparedStatement는 statement의 하위객체
//			그럼 pstmt가 아니라 statement로 닫아도 된다.
			DBConnection.close(conn, pstmt, null);
		}
//		오류가 날시 false로 리턴 catch에 붙여도 상관없다.
		return false;
	}

	public member selectOne(String id) {

		Member mem = null;
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		String sql = "select * from member where id=?";
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				member mem1 = new member();
				mem1.setId(rs.getString("id"));
				mem1.setPass(rs.getString("pass"));
				mem1.setName(rs.getString("name"));
				mem1.setGender(rs.getInt("gender"));
				mem1.setTel(rs.getString("tel"));
				mem1.setEmail(rs.getString("email"));
				mem1.setPicture(rs.getString("picture"));
				return mem1;
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			DBConnection.close(conn, pstmt, rs);
		}
		return null;

	}

	public List<member> list() {
		Connection conn = DBConnection.getConnection();
		String sql = "select * from member";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<member> list = new ArrayList<>();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				member mem = new member();
				mem.setId(rs.getString("id"));
				mem.setPass(rs.getString("pass"));
				mem.setName(rs.getString("name"));
				mem.setGender(rs.getInt("gender"));
				mem.setTel(rs.getString("tel"));
				mem.setEmail(rs.getString("email"));
				mem.setPicture(rs.getString("picture"));
				list.add(mem);
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(conn, pstmt, rs);
		}
		return null;

	}

	public boolean update(member mem) {
		// TODO Auto-generated method stub
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		String sql = "update member set name=?,gender=?,tel=?,email=?," + "picture=? where id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mem.getName());
			pstmt.setInt(2, mem.getGender());
			pstmt.setString(3, mem.getTel());
			pstmt.setString(4, mem.getEmail());
			pstmt.setString(5, mem.getPicture());
			pstmt.setString(6, mem.getId());
			return pstmt.executeUpdate() > 0;
		} catch (Exception e) {
			e.printStackTrace();
//			true로 해도 finally가 실행이 된다.
		} finally {
//			pstmt를 닫고 conn을 닫는다.preparedStatement는 statement의 하위객체
//			그럼 pstmt가 아니라 statement로 닫아도 된다.
			DBConnection.close(conn, pstmt, null);
		}
//		오류가 날시 false로 리턴 catch에 붙여도 상관없다.
		return false;
	}

	public boolean delete(String id) {
		// TODO Auto-generated method stub
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		String sql = "DELETE FROM bigdb.`member`WHERE id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			return pstmt.executeUpdate() > 0;
		} catch (Exception e) {
			e.printStackTrace();
//			true로 해도 finally가 실행이 된다.
		} finally {
//			pstmt를 닫고 conn을 닫는다.preparedStatement는 statement의 하위객체
//			그럼 pstmt가 아니라 statement로 닫아도 된다.
			DBConnection.close(conn, pstmt, null);
		}
//		오류가 날시 false로 리턴 catch에 붙여도 상관없다.
		return false;
	}

	public String idSearch(String email, String tel) {
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		String sql = "SELECT id FROM `member` AS M WHERE M.EMAIL = ? AND M.TEL = ?";
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, tel);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString("id");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(conn, pstmt, rs);
		}
		return null;

	}

	public String pwSearch(String id, String email, String tel) {
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		String sql = "SELECT pass FROM `member` AS M WHERE M.id = ? AND M.email = ? AND M.tel = ?";
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, email);
			pstmt.setString(3, tel);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString("pass");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(conn, pstmt, rs);
		}
		return null;

	}

	public boolean updatePass(String id, String old_password, String new_password) {

		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		String sql = "UPDATE bigdb.`member` SET pass = ? WHERE id = ? AND pass = ? ";
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, new_password);
			pstmt.setString(2, id);
			pstmt.setString(3, old_password);
			return pstmt.executeUpdate() > 0;

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(conn, pstmt, rs);
		}
		return false;
	}

}
