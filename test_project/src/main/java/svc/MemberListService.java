package svc;

import java.sql.Connection;
import java.util.List;

import dao.MemberDAO;
import db.JdbcUtil;
import vo.MemberBean;

public class MemberListService {
	Connection con;
	MemberDAO dao;
	
	public List<MemberBean> getMembmerList(int startRow,int listLimit) {
		con = JdbcUtil.getConnection();
		dao = MemberDAO.getInstance();
		dao.setConnection(con);
		
		List<MemberBean> list = dao.getMemberList(startRow,listLimit);
		
		
		JdbcUtil.close(con);
		return list;
	}

	public int getMemberListCount() {
		int insertCount = 0;
		con = JdbcUtil.getConnection();
		dao = MemberDAO.getInstance();
		dao.setConnection(con);
		
		insertCount = dao.getMemberListCount();
		
		
		JdbcUtil.close(con);
		return insertCount;
	}
	
	
	
	
	
}
