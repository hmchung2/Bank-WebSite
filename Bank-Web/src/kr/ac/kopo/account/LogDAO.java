package kr.ac.kopo.account;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.ac.kopo.util.ConnectionFactory;

public class LogDAO {
	public List<LogVO> selectLogs(String accNum , String days){
		List<LogVO> list = new ArrayList<>();
		StringBuilder sql = new StringBuilder();
		
		sql.append("select * from wc_log@wclink where (sysdate- t_date) < ? and acc_num = ?  order by t_date desc");
		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {			
	
			pstmt.setInt(1, Integer.parseInt(days) );	
			pstmt.setString(2, accNum);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				LogVO logVO = new LogVO();
				logVO.setLogDate(rs.getString("T_DATE"));
				logVO.setAccNum(rs.getString("ACC_NUM"));
				logVO.setAction(rs.getString("ACTION"));
				logVO.setAmount(rs.getInt("AMOUNT"));
				logVO.setOtherBankNum(rs.getString("OTHER_BANK_NAME"));
				logVO.setOtherAccNum(rs.getString("OTHER_ACC_NUM"));
				logVO.setPreBalance(rs.getInt("PRE_BALANCE"));
				logVO.setPostBalance(rs.getInt("POST_BALANCE"));
				list.add(logVO);				
			}
		}catch (Exception e) {
			e.printStackTrace();
		}						
		return list;
	}
	
	public List<LogVO> selectLogs(String accNum ){
		List<LogVO> list = new ArrayList<>();
		StringBuilder sql = new StringBuilder();
		
		sql.append("select * from wc_log@wclink where acc_num = ?  order by t_date desc");
		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {			
	
			pstmt.setString(1, accNum);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				LogVO logVO = new LogVO();
				logVO.setLogDate(rs.getString("T_DATE"));
				logVO.setAccNum(rs.getString("ACC_NUM"));
				logVO.setAction(rs.getString("ACTION"));
				logVO.setAmount(rs.getInt("AMOUNT"));
				logVO.setOtherBankNum(rs.getString("OTHER_BANK_NAME"));
				logVO.setOtherAccNum(rs.getString("OTHER_ACC_NUM"));
				logVO.setPreBalance(rs.getInt("PRE_BALANCE"));
				logVO.setPostBalance(rs.getInt("POST_BALANCE"));
				list.add(logVO);				
			}
		}catch (Exception e) {
			e.printStackTrace();
		}						
		return list;
		
		
	}	
	
}
