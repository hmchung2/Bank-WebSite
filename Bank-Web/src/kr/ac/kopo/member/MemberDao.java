package kr.ac.kopo.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.ac.kopo.account.AccountVO;
import kr.ac.kopo.util.ConnectionFactory;

public class MemberDao {
	
	public List<TotalMemberVO> selectAllTotal(String id){
		List<TotalMemberVO> list = new ArrayList<>();
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT  TOTAL_ID, ID , TOTAL_NICK , TOTAL_PWD, OPT1 , OPT2 , REG_DATE ");
		sql.append("  FROM WC_TOTAL_USER@WCLINK ");
		sql.append(" WHERE ID = ?  ORDER BY REG_DATE DESC");
		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {			
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				TotalMemberVO tmember = new TotalMemberVO();
				tmember.setTotalId(rs.getString("TOTAL_ID" ) );
				tmember.setId(rs.getString("ID")  );
				tmember.setTotalNick(rs.getString("TOTAL_NICK"));				
				tmember.setTotalPwd(rs.getString("TOTAL_PWD"));
				tmember.setOpt1(rs.getString("OPT1"));
				tmember.setOpt2(rs.getString("OPT2"));
				tmember.setRegDate(rs.getString("REG_DATE"));
				list.add(tmember);
			} 				
		}catch (Exception e) {
			e.printStackTrace();
		}				
		
		return list;
	}
	

	//중복 확인용 ajax checkId 파일 에서 사용
	public String checkId(String id) {
		StringBuilder sql = new StringBuilder();
		sql.append("select * from wc_user@wclink ");
		sql.append(" where id = ? ");
		String result = "0";
		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());

		) {
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				result = "1";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public String checkTotalId(String totalId) {
		StringBuilder sql = new StringBuilder();
		sql.append("select * from wc_total_user@wclink ");
		sql.append(" where total_id = ? ");
		String result = "0";
		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());

		) {
			pstmt.setString(1, totalId);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				result = "1";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public boolean validateTotalUser(String totalId , String totalPwd , String id) {
		Boolean result = false;
		StringBuilder sql = new StringBuilder();
		sql.append("select * from wc_total_user@wclink ");
		sql.append(" where total_id = ? and total_pwd = ? and id =? ");

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());

		) {
			pstmt.setString(1, totalId);
			pstmt.setString(2, totalPwd);
			pstmt.setString(3, id);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				result = true;
			}	
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return result;
	}
	
	
	public boolean totalSignUp(TotalMemberVO member) {
		Boolean result = false;
		StringBuilder sql = new StringBuilder();
		sql.append("INSERT INTO WC_TOTAL_USER@WCLINK (TOTAL_ID , ID, TOTAL_NICK , TOTAL_PWD , OPT1,  OPT2 )");
		sql.append(" VALUES (? , ? , ? , ? , ? , ? )");
		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		) {
			int loc = 1;
			pstmt.setString(loc++, member.getTotalId() );
			pstmt.setString(loc++, member.getId() );
			pstmt.setString(loc++, member.getTotalNick());
			pstmt.setString(loc++, member.getTotalPwd());
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
	
	public void updatePwd(MemberVO member){
		StringBuilder sql = new StringBuilder();
		sql.append("update WC_USER@WCLINK set PASSWORD = ? WHERE ID = ?");
		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		) { 
			pstmt.setString(1 , member.getPwd() );
			pstmt.setString(2 , member.getId() );			
			int rowCnt = pstmt.executeUpdate();
			if(rowCnt == 1){
				System.out.println("password update sucess");
			}else{
				System.out.println("password update failed");
			}
		
		}catch (Exception e) {
			e.printStackTrace();
		}		
	
	}
			
	public boolean signUp(MemberVO member) {
		Boolean result = false;
		StringBuilder sql = new StringBuilder();
		sql.append("INSERT INTO WC_USER@WCLINK (ID , PASSWORD, NAME , SSN , PHONE , EMAIL , OPT1 , OPT2 , USER_TYPE)");
		sql.append(" VALUES (? , ? , ? , ? , ? ,");
		sql.append(" ? , ? , ? ,?) ");
		
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
			pstmt.setString(loc, "1");
			int rowCnt = pstmt.executeUpdate();
			if(rowCnt == 1) {
				result = true;
			} 
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return result;
	}	
	
	public MemberVO kakaoSignIn(MemberVO member) {
		MemberVO userVO = null;
		StringBuilder sql = new StringBuilder();
		sql.append("select ID , PASSWORD, NAME , SSN , PHONE , EMAIL , OPT1 , OPT2, KAKAO_ID, KAKAO_EMAIL, USER_TYPE, REG_DATE");
		sql.append(" FROM WC_USER@WCLINK");
		sql.append(" WHERE KAKAO_ID =?");
		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());				
				) {			
			pstmt.setString(1 , member.getKakaoId());
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				userVO = new MemberVO();
				userVO.setId(rs.getString("ID"));
				userVO.setPwd(rs.getString("PASSWORD"));
				userVO.setName(rs.getString("NAME"));
				userVO.setSsn(rs.getString("SSN"));
				userVO.setPhone(rs.getString("PHONE"));
				userVO.setEmail(rs.getString("EMAIL"));
				userVO.setOpt1(rs.getString("OPT1"));
				userVO.setOpt2(rs.getString("OPT2"));	
				userVO.setKakaoId(rs.getString("KAKAO_ID"));
				userVO.setKakaoEmail(rs.getString("KAKAO_EMAIL"));
				userVO.setUser_type(rs.getString("USER_TYPE"));
				userVO.setRegDate(rs.getString("REG_DATE"));
			} 	
		}catch (Exception e) {			
			e.printStackTrace();						
		}						
		return userVO;
	}
	

	public MemberVO kakaoAutoSignUp(MemberVO member) {
		MemberVO userVO = null;
		StringBuilder sql = new StringBuilder();
		sql.append("INSERT INTO WC_USER@WCLINK (ID , PASSWORD, NAME , SSN , OPT1 , OPT2, KAKAO_ID, KAKAO_EMAIL , USER_TYPE)");
		sql.append(" VALUES(?, ?, ?, ?, ?, ?, ?, ? , ?) ");
		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());				
				) {					
			userVO = new MemberVO();
			userVO.setId(member.getKakaoId()  );
			userVO.setPwd(member.getKakaoId() );
			userVO.setName("고객"  );
			userVO.setSsn(member.getKakaoEmail());
			userVO.setOpt1("F");
			userVO.setOpt2("F");	
			userVO.setKakaoId(member.getKakaoId() );
			userVO.setKakaoEmail(member.getKakaoEmail() );
			userVO.setUser_type("2");
			int loc = 1;
			pstmt.setString(loc++, userVO.getId() );
			pstmt.setString(loc++, userVO.getPwd());
			pstmt.setString(loc++, userVO.getName() );
			pstmt.setString(loc++, userVO.getSsn());		
			pstmt.setString(loc++, userVO.getOpt1());
			pstmt.setString(loc++, userVO.getOpt2());
			pstmt.setString(loc++, userVO.getKakaoId());
			pstmt.setString(loc++, userVO.getKakaoEmail());
			pstmt.setString(loc++, userVO.getUser_type());
			int rowCnt = pstmt.executeUpdate();
			if (rowCnt != 1) {
				userVO = null;
			}else {
				userVO = kakaoSignIn(userVO);				
			}			
		}	catch (Exception e) {			
			e.printStackTrace();						
		}			
		return userVO ;
	}
	
	
	
	/*
	 * else { StringBuilder sql2 = new StringBuilder(); 
	 * sql.append("INSERT INTO WC_USER@WCLINK (ID , PASSWORD, NAME , SSN , PHONE , EMAIL , OPT1 , OPT2, KAKAO_ID, KAKAO_EMAIL)"
	 * ); sql2.append(" VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?"); int loc = 1;
	 * pstmt.setString(loc++, member.getKakaoId() ); pstmt.setString(loc++,
	 * member.getKakaoId() ) ; pstmt.setString(loc++, member.getKakaoId() );
	 * pstmt.setString(loc++, member.getKakaoId() ); pstmt.setString(loc++,
	 * member.getKakaoId() ); pstmt.setString(loc++, member.getKakaoEmail() ) ;
	 * pstmt.setString(loc++, "F" ); pstmt.setString(loc++, "F" );
	 * pstmt.setString(loc++, member.getKakaoId() ); pstmt.setString(loc++,
	 * member.getKakaoEmail() ) ; int rowCnt = pstmt.executeUpdate(); if(rowCnt ==
	 * 1) {
	 * 
	 * } }
	 */
	
	public MemberVO signin(MemberVO member) {
		MemberVO userVO = null;
		StringBuilder sql = new StringBuilder();
		sql.append("select ID , PASSWORD, NAME , SSN , PHONE , EMAIL , OPT1 , OPT2, KAKAO_ID, KAKAO_EMAIL , USER_TYPE, REG_DATE ");
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
				userVO.setRegDate(rs.getString( "REG_DATE" ));
				System.out.println(userVO.getRegDate() );
				String user_type = rs.getString("USER_TYPE") ;
				userVO.setUser_type(user_type);				
				if(user_type == "3") {
					userVO.setKakaoId(rs.getString("KAKAO_ID"));
					userVO.setKakaoEmail(rs.getString("KAKAO_EMAIL") );
				}			
			}
		} catch (Exception e) {			
			e.printStackTrace();						
		}				
		return userVO;
	}
	
}
