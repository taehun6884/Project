package test_project;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jbcp.JdbcUtil;

public class MemberDAO {
	Connection con;
	PreparedStatement pstmt,pstmt2;
	ResultSet rs;
	
	public int insertMember(MemberDTO dto) {
		int insertCount = 0;
		
		con = JdbcUtil.getConnection();
		
		String sql = "INSERT INTO member VALUES(?,?,?,?,?,?,?,?,?,now())";
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPass());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4,dto.getEmail());
			pstmt.setString(5, dto.getPost_code());
			pstmt.setString(6, dto.getAddress1());
			pstmt.setString(7, dto.getAddress2());
			pstmt.setString(8, dto.getPhone());
			pstmt.setString(9, dto.getMobile());
		
			insertCount = pstmt.executeUpdate();
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return insertCount;
	}
	//회원가입
	
	public boolean loginMember(String id,String pass) {
		boolean result = false;
		
		con = JdbcUtil.getConnection();
		
		String sql = "SELECT * FROM member WHERE id=? AND pass=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
		
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}//로그인
	
	public List<MemberDTO> memberList(MemberDTO dto){
		List<MemberDTO> list = null;
		
		con = JdbcUtil.getConnection();
		String sql = "SELECT * FROM member";
		
		try {
			pstmt = con.prepareStatement(sql);
		
			rs = pstmt.executeQuery();
		
			list = new ArrayList<MemberDTO>();
			while(rs.next()) {
				dto = new MemberDTO();
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setPost_code(rs.getString("post_code"));
				dto.setAddress1(rs.getString("address1"));
				dto.setAddress1(rs.getString("address2"));
				dto.setPhone(rs.getString("phone"));
				dto.setMobile(rs.getString("mobile"));
				dto.setDate(rs.getDate("date"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}
