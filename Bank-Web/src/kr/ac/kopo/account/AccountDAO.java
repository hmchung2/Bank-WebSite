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

	

	
	public MemberVO getUserByID(String id , String BankName) {
		MemberVO  memberVO = null;
		if(BankName.equals("700")) {
			memberVO = getWCUserByID(id);
			System.out.println("700 bank user table");
		}else if(BankName.equals("600")) {
			memberVO = getBSUserByID(id);
			System.out.println("BS bank user table");
			
		}else if(BankName.equals("800")) {
			memberVO = getMGUserByID(id);
			System.out.println("MG bank user table");
		}
		
		
		return memberVO ;
	}
	
	public AccountVO selectAccount(String accNum , String bankName) {
		AccountVO account = null;
		if(bankName.equals("700")) {
			account = selectWCAccount(accNum);			
		}else if(bankName.equals("600")) {
			account =  selectBSAccount(accNum);			
		}else if(bankName.equals("800")) {
			account = selectMGAccount(accNum);			
		}		
		return account;		
	}
	
	public boolean withdraw(Connection conn ,  String bankName, String accNum , int amount) throws SQLException {
		boolean result = false;
		if(bankName.equals("700")) {
			System.out.println("wc withdraw");			
			result = wcWithdraw( conn, accNum , amount);			
		}else if(bankName.equals("600")) {
			result = bsWithdraw(conn, accNum, amount);			
		}else if(bankName.equals("800")) {
			result = mgWithdraw(conn, accNum, amount);
		}
		
		return result;
	}
	
	
	public boolean deposit(Connection conn , String bankName, String accNum , int amount) throws SQLException {
		boolean result = false;
		if(bankName.equals("700")) {
			System.out.println("wc deposit");
			result = wcDeposit(conn, accNum, amount);			
		}else if(bankName.equals("600")) {			
			result = bsDeposit(conn, accNum, amount);
		}else if(bankName.equals("800")) {
			result = mgWithdraw(conn, accNum, amount);
		}		
		return result;
	}	
	
	
	
	public boolean insertDepositLog(Connection conn, String bankName, String otherBankName, String accNum,
			String otherAccNum, int amount, int preBal) throws SQLException {
		boolean result = false;
		if (bankName.equals("700")) {
			result = insertWCDepositLog(conn, otherBankName, accNum, otherAccNum, amount, preBal);
		} else if (bankName.equals("600")) {
			result = insertBSDepositLog(conn, otherBankName, accNum, otherAccNum, amount, preBal);
		} else if(bankName.equals("800")) {
			result = insertMGDepositLog(conn, otherBankName, accNum, otherAccNum, amount, preBal);
		}
		return result;
	}
		
	
	public boolean insertWithdrawLog(Connection conn, String bankName, String otherBankName, String accNum,
			String otherAccNum, int amount, int preBal) throws SQLException {
		boolean result = false;
		if (bankName.equals("700")) {
			result = insertWCWithdrawLog(conn, otherBankName, accNum, otherAccNum, amount, preBal);
		} else if (bankName.equals("600")) {
			result = insertBSWithdrawLog(conn, otherBankName, accNum, otherAccNum, amount, preBal);
		} else if (bankName.equals("800")) {
			result = insertMGWithdrawLog(conn, otherBankName, accNum, otherAccNum, amount, preBal);
		}
		return result;
	}


	//////////////////////////////////////////
	
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
	
	public MemberVO getWCUserByID(String id) {
		MemberVO memberVO = null;
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT NAME , PHONE , EMAIL ,  OPT1 , OPT2, SSN");
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
				memberVO.setSsn(rs.getString("SSN"));   /// 다른 은행에서도 필수로 갖고와야함.
			}			
		}catch (Exception e) {
			e.printStackTrace();
		}		
		return memberVO;
	}
	
	public MemberVO getBSUserByID(String id) {
		MemberVO memberVO = null;
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT RRN, NAME,  EMAIL_ID , EMAIL_DOMAIN , TEL1, TEL2 , TEL3");
		sql.append(" FROM T_MEMBER@BSLINK ");
		sql.append(" WHERE ID = ?");
		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				String userEmail = rs.getString("EMAIL_ID") + "@"  + rs.getString("EMAIL_DOMAIN");
				String userPhone = rs.getString("TEL1") + "-" + rs.getString("TEL2") + rs.getString("TEL3");
				memberVO  = new MemberVO();
				memberVO.setName(rs.getString("NAME"));
				memberVO.setPhone(userPhone);
				memberVO.setEmail(userEmail);
				memberVO.setSsn(rs.getString("RRN")); 			
			}		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return memberVO;
	}
	
	public MemberVO getMGUserByID(String id) {		
		MemberVO memberVO = null;
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT REGISTRATION_NUMBER, NAME,  EMAIL , PHONE_NUMBER");
		sql.append(" FROM BANK_USER@MGLINK ");
		sql.append(" WHERE U_ID = ?");
		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				memberVO  = new MemberVO();
				memberVO.setName(rs.getString("NAME"));
				memberVO.setPhone(rs.getString("PHONE_NUMBER"));
				memberVO.setEmail(rs.getString("EMAIL"));
				memberVO.setSsn(rs.getString("REGISTRATION_NUMBER")); 					
			}
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return memberVO;
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
	
	
	public boolean bsDeposit(Connection conn , String accNum , int amount) throws SQLException{
		boolean result = false;
		StringBuilder sql = new StringBuilder();
		sql.append("UPDATE T_ACCOUNT@BSLINK SET BALANCE = BALANCE + ? WHERE regexp_replace(ACC_NO, '[^0-9]', '') = ?");
		PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		pstmt.setInt(1,amount);
		pstmt.setString(2, accNum);
		int cnt = pstmt.executeUpdate();
		if(cnt ==  1) {
			result = true;
			System.out.println("bs Deposit worked");
		}				
		return result;		
	}
	
	public boolean bsWithdraw(Connection conn , String accNum , int amount) throws SQLException{
		boolean result = false;
		StringBuilder sql = new StringBuilder();
		sql.append("UPDATE T_ACCOUNT@BSLINK SET BALANCE = BALANCE - ? WHERE regexp_replace(ACC_NO, '[^0-9]', '') = ?");
		PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		pstmt.setInt(1,amount);
		pstmt.setString(2, accNum);
		int cnt = pstmt.executeUpdate();
		if(cnt ==  1) {
			result = true;
			System.out.println("bs withdraw worked");
		}						
		return result;
	}
	
	public boolean mgWithdraw(Connection conn , String accNum , int amount) throws SQLException{
		boolean result = false;
		StringBuilder sql = new StringBuilder();
		sql.append("UPDATE MG_BANK@MGLINK");
		sql.append(" SET BALANCE = BALANCE - ?");
		sql.append(" WHERE regexp_replace(ACCOUNT_NUMBER, '[^0-9]', '') = ?");
		PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		pstmt.setInt(1,amount);
		pstmt.setString(2, accNum);
		int cnt = pstmt.executeUpdate();
		if(cnt ==  1) {
			result = true;
			System.out.println("MGWithdraw worked");
		}		
		return result;		
	}
	
	public boolean mgDeposit(Connection conn , String accNum , int amount) throws SQLException{
		boolean result = false;
		StringBuilder sql = new StringBuilder();
		sql.append("UPDATE MG_BANK@MGLINK");
		sql.append(" SET BALANCE = BALANCE + ?");
		sql.append(" WHERE regexp_replace(ACCOUNT_NUMBER, '[^0-9]', '') = ?");
		PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		pstmt.setInt(1,amount);
		pstmt.setString(2, accNum);
		int cnt = pstmt.executeUpdate();
		if(cnt ==  1) {
			result = true;
			System.out.println("MGDeposit worked");
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
	
	
	public List<TotalAccountVO> selectAllTotalAccounts(String totalId){
		List<TotalAccountVO> list = new ArrayList<>();
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT  BANK_NAME , ACC_NUM, TOTAL_ID , REG_DATE");
		sql.append(" FROM WC_TOTAL_ACCOUNT@WCLINK ");
		sql.append(" WHERE TOTAL_ID = ?  ORDER BY REG_DATE DESC");
		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {	
			pstmt.setString(1, totalId);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				TotalAccountVO totalAccount = new TotalAccountVO();
				totalAccount.setBankName(rs.getString("BANK_NAME"));
				totalAccount.setAccNum(rs.getString("ACC_NUM"));
				totalAccount.setTotalId(totalId);
				totalAccount.setRegDate(rs.getString("REG_DATE"));
				list.add(totalAccount);				
			}
		}	catch (Exception e) {
			e.printStackTrace();
		}	
		return list;		
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
				account.setId(rs.getString("ID"));   //이거 꼭 갖고 와야 한다.
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
	
	public AccountVO selectMGAccount(String accNum) {
		AccountVO account = null;
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT U_ID,  regexp_replace(ACCOUNT_NUMBER, '[^0-9]', '') AS ACC_NUM ,");
		sql.append(" BALANCE , ACCOUNT_REG_DATE , ACCOUNT_NICKNAME");
		sql.append("  FROM MG_BANK@MGLINK ");
		sql.append(" WHERE regexp_replace(ACCOUNT_NUMBER, '[^0-9]', '') = ?");
		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {			
			pstmt.setString(1, accNum);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				account = new AccountVO();
				account.setId(rs.getString("U_ID"));
				account.setAccNum(rs.getString("ACC_NUM"));
				account.setNick(rs.getString("ACCOUNT_NICKNAME"));
				account.setAccBalance(rs.getInt("BALANCE"));
				account.setRegDate(rs.getString("ACCOUNT_REG_DATE"));
			}			
		}catch (Exception e) {
			e.printStackTrace();
		}						
		return account;		
	}
	

	public AccountVO selectBSAccount(String accNum) {
		AccountVO account = null;
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT ID, regexp_replace(ACC_NO, '[^0-9]', '') AS ACC_NUM , ACC_NICKNAME , ACC_PW , BALANCE, ACC_CREATING_DATE");
		sql.append("  FROM T_ACCOUNT@BSLINK ");
		sql.append(" WHERE regexp_replace(ACC_NO, '[^0-9]', '') = ?");
		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			
			pstmt.setString(1, accNum);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				account = new AccountVO() ;
				account.setId(rs.getString("ID"));
				account.setAccNum(rs.getString("ACC_NUM"));
				account.setNick(rs.getString("ACC_NICKNAME"));
				account.setAccPwd(rs.getString("ACC_PW"));
				account.setAccBalance(rs.getInt("BALANCE"));
				account.setRegDate(rs.getString("ACC_CREATING_DATE"));			
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
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public boolean insertTotalWCAccount(AccountVO account, String totalId, String bankName) {
		Boolean result = false;
		StringBuilder sql = new StringBuilder();
		sql.append("INSERT INTO WC_TOTAL_ACCOUNT@WCLINK (BANK_NAME , ACC_NUM , TOTAL_ID  )");
		sql.append(" VALUES(? , ? , ?  )");
		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			
			pstmt.setString(1, bankName );
			pstmt.setString(2, account.getAccNum() );
			pstmt.setString(3, totalId );
			int rowCnt = pstmt.executeUpdate();
			if(rowCnt == 1) {
				return true;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}		
		return result;
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
	
	public boolean insertBSWithdrawLog(Connection conn, String otherBankName ,  String accNum , String otherAccNum, int amount , int preBal ) throws SQLException {
		boolean result = false;
		StringBuilder sql = new StringBuilder();
		String accNum1 = accNum.substring(0,3) + "-" + accNum.substring(3,6) + "-" + accNum.substring(6,9); 
		sql.append("INSERT INTO TRANSFER_LOG@BSLINK (SENDING_BANK_NAME, SENDING_ACC_NO, BEFORE_BALANCE, REMITTANCE, AFTER_BALANCE,");
		sql.append(" RECEIVING_BANK_NAME, RECEIVING_ACC_NO)");
		sql.append(" VALUES(?, ?, ?, ?, ?, ?, ?)");		
		PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		int loc = 1;
		pstmt.setString(loc++, otherBankName );	
		pstmt.setString(loc++, otherAccNum);
		pstmt.setInt(loc ++ , preBal);
		pstmt.setInt(loc++, amount);
		pstmt.setInt(loc++, preBal - amount);
		pstmt.setString(loc++,  "600" );
		pstmt.setString(loc++, accNum1);
		int rowCnt = pstmt.executeUpdate();
		if(rowCnt == 1) {
			result= true;
			System.out.println("insert Dposit BC log worked");
		}		
		return result;
	}
	
	
	
	
	
	
	
	
	public boolean insertWCDepositLog(Connection conn, String otherBankName ,  String accNum , String otherAccNum, int amount , int preBal ) throws SQLException {
		boolean result = false;
		StringBuilder sql = new StringBuilder();
		sql.append("INSERT INTO WC_LOG@WCLINK (ACC_NUM ,  ACTION , AMOUNT , OTHER_ACC_NUM , OTHER_BANK_NAME , PRE_BALANCE  , POST_BALANCE  )");
		sql.append(" RECEIVING_BANK_NAME, RECEIVING_ACC_NO)");
		sql.append(" VALUES(?, ?, ?, ?, ?, ?, ?)");	
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
	
	public boolean insertBSDepositLog(Connection conn, String otherBankName ,  String accNum , String otherAccNum, int amount , int preBal ) throws SQLException {
		boolean result = false;
		StringBuilder sql = new StringBuilder();
		String accNum1 = accNum.substring(0,3) + "-" + accNum.substring(3,6) + "-" + accNum.substring(6,9); 
		sql.append("INSERT INTO TRANSFER_LOG@BSLINK (SENDING_BANK_NAME, SENDING_ACC_NO, BEFORE_BALANCE, REMITTANCE, AFTER_BALANCE,");
		sql.append(" RECEIVING_BANK_NAME, RECEIVING_ACC_NO)");
		sql.append(" VALUES (?,  ? ,  ? , ? ,  ? ,  ? ,  ? )");		
		PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		int loc = 1;
		pstmt.setString(loc++, otherBankName );	
		pstmt.setString(loc++, otherAccNum);
		pstmt.setInt(loc ++ , preBal);
		pstmt.setInt(loc++, amount);
		pstmt.setInt(loc++, preBal + amount);
		pstmt.setString(loc++,  "600" );
		pstmt.setString(loc++, accNum1);
		int rowCnt = pstmt.executeUpdate();
		if(rowCnt == 1) {
			result= true;
			System.out.println("insert Dposit BC log worked");
		}		
		return result;
	}
	
	
	public boolean insertMGDepositLog(Connection conn, String otherBankName ,  String accNum , String otherAccNum, int amount , int preBal ) throws SQLException {
		boolean result = false;

		StringBuilder sql = new StringBuilder();
		sql.append("INSERT INTO BANK_ORDERS@MGLINK");
		sql.append(" VALUES(BANKORDERS_SEQ.NEXTVAL@MGLINK, ? , '이체(입금)' , sysdate , ? ,  ? , ? , (select mid from mg_bank@mglink where regexp_replace(ACCOUNT_NUMBER, '[^0-9]', '') = ? )  )  " ); 			
		PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		int loc = 1;
		pstmt.setInt(loc++, preBal + amount);
		System.out.println("problem starts");
		System.out.println(preBal + amount);
		pstmt.setString(loc++, otherAccNum);
		System.out.println(otherAccNum);
		pstmt.setString(loc++, otherBankName);		
		System.out.println(otherBankName);
		pstmt.setInt(loc++, preBal);
		System.out.println(preBal);
		pstmt.setString(loc++, accNum);
		System.out.println(accNum);

		int rowCnt = pstmt.executeUpdate();
		if(rowCnt == 1) {
			result= true;
			System.out.println("insert MGDepositlog worked");
		}		
		return result;
	}
	
	
	public boolean insertMGWithdrawLog(Connection conn, String otherBankName ,  String accNum , String otherAccNum, int amount , int preBal ) throws SQLException {
		boolean result = false;
		StringBuilder sql = new StringBuilder();
		sql.append("INSERT INTO BANK_ORDERS@MGLINK");
		sql.append(" VALUES(BANKORDERS_SEQ.NEXTVAL@MGLINK, ? , '이체(출금)' , sysdate , ? ,  ? , ? , "  ); 		
		sql.append(" (select mid from  mg_bank@mglink where regexp_replace(ACCOUNT_NUMBER, '[^0-9]', '') = ? )  )");
		PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		int loc = 1;
		pstmt.setInt(loc++, preBal - amount);
		pstmt.setString(loc++, otherAccNum);
		pstmt.setString(loc++, otherBankName);
		pstmt.setInt(loc++, preBal);
		pstmt.setString(loc++, accNum);
		int rowCnt = pstmt.executeUpdate();
		if(rowCnt == 1) {
			result= true;
			System.out.println("insert MGDepositlog worked");
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
	
	public boolean insertTotalAccount(AccountVO account, String bankName , String totalId ) {
		Boolean result = false;
		result = insertTotalWCAccount(account, totalId , bankName);									
		return result;
	}
	
		
}
