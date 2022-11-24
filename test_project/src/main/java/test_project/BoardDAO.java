package test_project;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.cj.protocol.Resultset;
import com.mysql.cj.xdevapi.Result;

import jbcp.JdbcUtil;

public class BoardDAO {

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
		
	//게시글 삽입
	public int insertBoard(BoardDTO dto) {
		
		int insertCount = 0;
		
		con = JdbcUtil.getConnection();
		
		
		String sql = "INSERT INTO board VALUES(?,?,?,?,?,now(),?)";
		
		try {
			pstmt = con.prepareStatement(sql);
			
			
			//게시글 번호 처리 -> auto Increment 속성 지정함.
			pstmt.setInt(1, dto.getIdx());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getPass());
			pstmt.setString(4, dto.getSubject());
			pstmt.setString(5, dto.getContent());
			pstmt.setInt(6, dto.getReadcount());
			
			insertCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL구문 성공 - insertBoard");
			e.printStackTrace();
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(con);
		}
		
		return insertCount;
	}//insertBoard 끝
	
	
	//게시판에 뿌리는 메서드
	
	public List<BoardDTO> selectBoard(){
		
		List<BoardDTO> boardList= null;
		con = JdbcUtil.getConnection();
		
		String sql = "SELECT idx, subject, name, date, readcount FROM board";
		
		try {
			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				boardList = new ArrayList<BoardDTO>();
				
				dto.setIdx(rs.getInt("idx"));
				dto.setSubject(rs.getString("subject"));
				dto.setName(rs.getString("name"));
				dto.setDate(rs.getTimestamp("date"));
				dto.setReadcount(rs.getInt("readcount"));
				
				boardList.add(dto);
			}
		} catch (SQLException e) {
			System.out.println("SQL구문 성공 - selectBoard");
			e.printStackTrace();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(con);
		}
		
		
		
		
		
		return boardList;
		
		
		
	}//selectBoard 끝
	
	

}
