package svc;

import java.sql.Connection;

import dao.MemberDAO;
import db.JdbcUtil;
import vo.MemberBean;

public class MemberInsertProService {

	public boolean InsertMember(MemberBean vo) {
		boolean isInsertMember = false;
		
		Connection con = JdbcUtil.getConnection();
		
		MemberDAO dao = MemberDAO.getInstance();
		
		dao.setConnection(con);
		
		int insertCount = dao.insertMember(vo);
		
		
		
		return false;
	}
	
	
	
	
}
