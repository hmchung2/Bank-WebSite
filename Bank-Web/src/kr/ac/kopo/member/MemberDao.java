package kr.ac.kopo.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import kr.ac.kopo.util.ConnectionFactory;

public class MemberDao {

	public String checkId(String name) {
		StringBuilder sql = new StringBuilder();
		sql.append("select * from wc_user@wclink ");
		sql.append(" where id = ? ");
		String result = "0";
		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());

		) {
			pstmt.setString(1, name);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				result = "1";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public boolean signUp(MemberVO member) {
		Boolean result = false;
		StringBuilder sql = new StringBuilder();
		sql.append("INSERT INTO WC_USER@WCLINK (ID , PASSWORD, NAME , SSN , PHONE , EMAIL , OPT1 , OPT2)");
		sql.append(" VALUES (? , ? , ? , ? , ? ,");
		sql.append(" ? , ? , ? ) ");
		
		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());

		) {
			int loc = 1;
			pstmt.setString(loc++, member.getId() );
			pstmt.setString(loc++, member.getPwd());
			pstmt.setString(loc++, member.getName());
			pstmt.setString(loc++, member.getSsn());
			pstmt.setString(loc++, member.getPhone());
			pstmt.setString(loc++, member.getEmail());			
			pstmt.setString(loc++, member.getOpt1());
			pstmt.setString(loc++, member.getOpt2());
			int rowCnt = pstmt.executeUpdate();
			if(rowCnt == 1) {
				result = true;
			} 
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return result;
	}
	
	public MemberVO signin(MemberVO member) {
		MemberVO userVO = null;
		StringBuilder sql = new StringBuilder();
		sql.append("select ID , PASSWORD, NAME , SSN , PHONE , EMAIL , OPT1 , OPT2 ");
		sql.append(" FROM WC_USER@WCLINK");
		sql.append(" WHERE ID =? AND PASSWORD =?");
		
		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
				
				) {
			pstmt.setString(1 , member.getId());
			pstmt.setString(2 , member.getPwd());			
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				userVO = new MemberVO();
				userVO.setId(rs.getString("ID"));
				userVO.setPwd(rs.getString("PASSWORD"));
				userVO.setName(rs.getString("NAME"));
				userVO.setSsn(rs.getString("SSN"));
				userVO.setPhone(rs.getString("PHONE"));
				userVO.setEmail(rs.getString("EMAIL"));
				userVO.setOpt1(rs.getString("OPT1"));
				userVO.setOpt2(rs.getString("OPT2"));		
			}
		} catch (Exception e) {			
			e.printStackTrace();						
		}		
		
		return userVO;
	}
	
}
