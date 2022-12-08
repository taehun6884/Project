package svc;

import java.sql.Connection;

import dao.MemberDAO;
import db.JdbcUtil;
import vo.MemberBean;

public class MemberInfoService {

	public MemberBean getMemberInfo(String id) {
		MemberBean vo = null;
		
		Connection con = JdbcUtil.getConnection();
		MemberDAO dao = MemberDAO.getInstance();
		
		dao.setConnection(con);
		
		vo = dao.getMemberInfo(id);
		
		
		JdbcUtil.close(con);
		
		
		return vo;
	}

}
