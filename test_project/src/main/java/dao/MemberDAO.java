package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import vo.MemberBean;

public class MemberDAO {
private MemberDAO() {}
	
	private static MemberDAO instance = new MemberDAO();

	public static MemberDAO getInstance() {
		return instance;
	}
	// ----------------------------------------------------------------------------------
	// 데이터베이스 접근에 사용할 Connection 객체를 Service 객체로부터 전달받기 위한
	// Connection 타입 멤버변수 선언 및 Setter 메서드 정의
	private Connection con;

	public void setConnection(Connection con) {
		this.con = con;
	}

	public int insertMember(MemberBean vo) {
		int insertCount = 0;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO member VALUES(?,?,?,?,?,?,?,?,?,now())"; 
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPass());
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getEmail());
			pstmt.setString(5, vo.getPost_code());
			pstmt.setString(6, vo.getAddress1());
			pstmt.setString(7, vo.getAddress2());
			pstmt.setString(8, vo.getPhone());
			pstmt.setString(9, vo.getMobile());
		
			insertCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return insertCount;
	}

	public boolean isRightUser(String id, String pass) {
		boolean isRightUser = false;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT id,pass FROM member WHERE id=? AND pass=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				isRightUser = true;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return isRightUser;
	}
}
