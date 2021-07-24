package kr.ac.kopo.account;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.ac.kopo.member.MemberVO;
import kr.ac.kopo.util.ConnectionFactory;
import kr.ac.kopo.util.JDBCClose;

public class AccountDAO {

	
	public boolean checkSameAcc(String newAccNum) {
		StringBuilder sql = new StringBuilder();
		sql.append("select * from WC_ACCOUNT@WCLINK ");
		sql.append(" where acc_num = ? ");
		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		) {
			pstmt.setString(1 , newAccNum);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}			
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}		
		return false;
	}
	
	public MemberVO getUserByID(String id , String BankName) {
		MemberVO  memberVO = null;
		if(BankName.equals("700")) {
			memberVO = getWCUserByID(id);
			System.out.println("700 bank user table");
		}		
		return memberVO ;
	}
	public MemberVO getWCUserByID(String id) {
		MemberVO memberVO = null;
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT NAME , PHONE , EMAIL , OPT1 , OPT2");
		sql.append("  FROM WC_USER@WCLINK ");
		sql.append(" WHERE ID = ?");
		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				memberVO  = new MemberVO();
				memberVO.setName(rs.getString("NAME"));
				memberVO.setPhone(rs.getString("PHONE"));
				memberVO.setEmail(rs.getString("EMAIL"));
				memberVO.setOpt1(rs.getString("OPT1"));
				memberVO.setOpt2(rs.getString("OPT2"));				
			}			
		}catch (Exception e) {
			e.printStackTrace();
		}		
		return memberVO;
	}
	
	
	
	
	public List<AccountVO> selectAllAccounts(String id){
		List<AccountVO> list = new ArrayList<>();
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT  ACC_NUM , NICK , ACC_PWD , ACC_BALANCE , MAXOPT , MAXVAL , OPENOPT , REG_DATE");
		sql.append("  FROM WC_ACCOUNT@WCLINK ");
		sql.append(" WHERE ID = ?  ORDER BY REG_DATE DESC");
		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {			
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				AccountVO account = new AccountVO();
				account.setAccNum(rs.getString("ACC_NUM" ) );
				account.setNick(rs.getString("NICK")  );
				account.setAccPwd(rs.getString("ACC_PWD"));				
				account.setAccBalance(rs.getInt("ACC_BALANCE"));
				account.setMaxOpt(rs.getString("MAXOPT"));
				account.setMaxVal(rs.getInt("MAXVAL"));
				account.setOpenOpt(rs.getString("OPENOPT"));
				account.setRegDate(rs.getString("REG_DATE"));
				list.add(account);
			} 				
		}catch (Exception e) {
			e.printStackTrace();
		}				
		return list;
		
	}
	
	public AccountVO selectAccount(String accNum , String bankName) {
		AccountVO account = null;
		if(bankName.equals("700")) {
			account = selectWCAccount(accNum);			
		}		
				
		return account;		
	}
	
	public AccountVO selectWCAccount(String accNum) {
		AccountVO account = null;
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT ID, ACC_NUM , NICK , ACC_PWD , ACC_BALANCE , MAXOPT , MAXVAL , OPENOPT , REG_DATE");
		sql.append("  FROM WC_ACCOUNT@WCLINK ");
		sql.append(" WHERE ACC_NUM = ?");
		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			
			pstmt.setString(1, accNum);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				account = new AccountVO() ;
				account.setId(rs.getString("ID"));
				account.setAccNum(rs.getString("ACC_NUM"));
				account.setNick(rs.getString("NICK"));
				account.setAccPwd(rs.getString("ACC_PWD"));
				account.setAccBalance(rs.getInt("ACC_BALANCE"));
				account.setMaxOpt(rs.getString("MAXOPT"));
				account.setMaxVal(rs.getInt("MAXVAL"));
				account.setOpenOpt(rs.getString("OPENOPT"));
				account.setRegDate(rs.getString("REG_DATE"));	
			}				
		}catch (Exception e) {
			e.printStackTrace();
		}		
		return account;		
	}

	

	public boolean createAcc(AccountVO acc) {
		StringBuilder sql = new StringBuilder();
		sql.append(
				"INSERT INTO WC_ACCOUNT@WCLINK (ACC_NUM , NICK, ID , ACC_PWD ,ACC_BALANCE , MAXOPT,MAXVAL , OPENOPT)");
		sql.append(" VALUES(?, ?, ?, ?, ?, ?, ?, ?) ");
		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			int loc = 1;
			pstmt.setString(loc++, acc.getAccNum() );
			pstmt.setString(loc++, acc.getNick() );
			pstmt.setString(loc++, acc.getId() );
			pstmt.setString(loc++, acc.getAccPwd() );		
			pstmt.setInt(loc++, acc.getAccBalance() );
			pstmt.setString(loc++, acc.getMaxOpt()  );
			pstmt.setInt(loc++, acc.getMaxVal() );
			pstmt.setString(loc++, acc.getOpenOpt()  );
			int rowCnt = pstmt.executeUpdate();
			if(rowCnt == 1) {
				return true;
				// else{  roll back } 만들어야함. 하지만 너무 바빠서 스킵
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}


	
	public boolean insertWCWithdrawLog(Connection conn , String otherBankName , String accNum , String otherAccNum , int amount ,  int preBal ) throws SQLException {
		boolean result = false;
		StringBuilder sql = new StringBuilder();
		sql.append("INSERT INTO WC_LOG@WCLINK (ACC_NUM ,  ACTION , AMOUNT , OTHER_ACC_NUM , OTHER_BANK_NAME , PRE_BALANCE  , POST_BALANCE  )");
		sql.append(" VALUES(? , ? , ? , ? , ? , ? , ?  )");
		PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		int loc = 1;
		pstmt.setString(loc++, accNum);		
		pstmt.setString(loc++, "W");
		pstmt.setInt(loc++, amount);		
		pstmt.setString(loc++,  otherAccNum);
		pstmt.setString(loc++,  otherBankName);
		pstmt.setInt(loc++ ,  preBal  );
		pstmt.setInt(loc++,preBal - amount  );
		int rowCnt = pstmt.executeUpdate();
		if(rowCnt == 1) {
			result= true;
			System.out.println("insert Withdraw WC log worked");
		}
		return result;		
	}
	
	
	
	public boolean insertWCDepositLog(Connection conn, String otherBankName ,  String accNum , String otherAccNum, int amount , int preBal ) throws SQLException {
		boolean result = false;
		StringBuilder sql = new StringBuilder();
		sql.append("INSERT INTO WC_LOG@WCLINK (ACC_NUM ,  ACTION , AMOUNT , OTHER_ACC_NUM , OTHER_BANK_NAME , PRE_BALANCE  , POST_BALANCE  )");
		sql.append(" VALUES(? , ? , ? , ? , ? , ? , ?  )");
		PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		int loc = 1;
		pstmt.setString(loc++, accNum);		
		pstmt.setString(loc++, "D");
		pstmt.setInt(loc++, amount);		
		pstmt.setString(loc++,  otherAccNum);
		pstmt.setString(loc++,  otherBankName);
		pstmt.setInt(loc++ ,  preBal  );
		pstmt.setInt(loc++,preBal + amount  );
		int rowCnt = pstmt.executeUpdate();
		if(rowCnt == 1) {
			result= true;
			System.out.println("insert Dposit WC log worked");
		}
		return result;
	}
	
	public boolean insertDepositLog(Connection  conn , String bankName ,  String otherBankName,  String accNum , String otherAccNum,   int amount , int preBal   ) throws SQLException {
		boolean result = false;
		if(bankName.equals("700")) {
			result = insertWCDepositLog(conn , otherBankName , accNum , otherAccNum , amount  , preBal);			
			}			
		return result;
		}		
		
	
	public boolean insertWithdrawLog(Connection conn , String bankName , String otherBankName , String accNum , String otherAccNum , int amount , int preBal) throws SQLException {
		boolean result = false;
		if(bankName.equals("700")) {		
			result = insertWCWithdrawLog(conn,  otherBankName,  accNum , otherAccNum , amount , preBal);
		}		
		return result;
	}
	
	public Map<String, String> transaction(String fromBankName ,  String fromAccNum , String toBankName , String toAccNum  , int amount , int fromPreBal , int toPreBal ){
		Map<String, String> result = new HashMap<String, String>();
		Connection conn = new ConnectionFactory().getConnection();
		try {			
			conn.setAutoCommit(false);
			boolean withdrawResult =  withdraw(conn, fromBankName, fromAccNum, amount);
			boolean depositResult = deposit( conn , toBankName , toAccNum , amount  );			
			boolean withdrawLogResult = insertWithdrawLog(conn ,  fromBankName,  toBankName, fromAccNum , toAccNum , amount , fromPreBal );
			boolean depositLogResult = insertDepositLog(conn,  toBankName,  fromBankName,   toAccNum,  fromAccNum, amount, toPreBal);
			
			if(withdrawResult && depositResult && withdrawLogResult && depositLogResult) {
				System.out.println("commiting");
				conn.commit();
				result.put("result", "true");
			}else {
				conn.rollback();	
				System.out.println("rollback");
				result.put("result", "false");
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			result.put("result", "false");
			try {
				conn.rollback();
				result.put("result", "false");
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
				result.put("result", "false");
			}			
		} finally {
			JDBCClose.close(conn, null);
		}
				
		return result ;
	}	
	public boolean withdraw(Connection conn ,  String bankName, String accNum , int amount) throws SQLException {
		boolean result = false;
		if(bankName.equals("700")) {
			System.out.println("wc withdraw");			
			result = wcWithdraw( conn, accNum , amount);			
		}		
		return result;
	}	
	public boolean deposit(Connection conn , String bankName, String accNum , int amount) throws SQLException {
		boolean result = false;
		if(bankName.equals("700")) {
			System.out.println("wc deposit");
			result = wcDeposit(conn, accNum, amount);
			
		}		
		return result;
	}	
	public boolean wcDeposit(Connection conn, String accNum , int amount) throws SQLException{
		boolean result = false;
		StringBuilder sql = new StringBuilder();
		sql.append("update WC_ACCOUNT@WCLINK");
		sql.append(" set ACC_BALANCE = ACC_BALANCE + ? where ACC_NUM = ? ");
		PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		pstmt.setInt(1,amount);
		pstmt.setString(2, accNum);
		int cnt = pstmt.executeUpdate();
		if(cnt ==  1) {
			result = true;
			System.out.println("wc Deposit worked");
		}		
		return result;
	}
		
	public boolean wcWithdraw(Connection conn , String accNum , int amount) throws SQLException {
		boolean result = false;
		StringBuilder sql = new StringBuilder();
		sql.append("update WC_ACCOUNT@WCLINK");
		sql.append(" set ACC_BALANCE = ACC_BALANCE - ? where ACC_NUM = ? ");
		PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		pstmt.setInt(1,amount);
		pstmt.setString(2, accNum);
		int cnt = pstmt.executeUpdate();
		if(cnt ==  1) {
			result = true;
			System.out.println("wcWithdraw worked");
		}		
		return result;
	}	
}
