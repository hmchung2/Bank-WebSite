package kr.ac.kopo.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.ac.kopo.util.ConnectionFactory;

public class BoardDAO {
	
	
	
	public void insert(BoardVO board) {

		StringBuilder sql = new StringBuilder();
		sql.append("insert into wc_board@wclink( ID , TITLE , VIEW_COUNT, VIS , MESSAGE  ) ");		
		sql.append(" values(?, ?, ?, ? , ? ) ");

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			int loc = 1;
			pstmt.setString(loc++, board.getWriter());
			pstmt.setString(loc++, board.getTitle());
			pstmt.setInt(loc++, 0 );
			pstmt.setString(loc++, board.getVisbility());
			pstmt.setString(loc++, board.getMessage());
			pstmt.executeUpdate();						
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void insertReply(BoardReplyVO replyVO) {
		StringBuilder sql = new StringBuilder();
		sql.append("INSERT INTO WC_BOARD_REPLY@WCLINK(ID , INDEX_ORDER , MESSAGE ) ");
		sql.append(" values(? , ? , ? )");
		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {			
			pstmt.setString(1, replyVO.getWriter());
			pstmt.setInt(2, replyVO.getNo() );
			pstmt.setString(3, replyVO.getMessage());
			pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}		
	}
	
	
	public List<BoardVO> selectAllBoard(){
		List<BoardVO> list = new ArrayList<BoardVO>();
		
		StringBuilder sql = new StringBuilder();
		sql.append("select index_order, REG_DATE, ID, TITLE , VIEW_COUNT, MESSAGE ");
		sql.append("  from WC_BOARD@WCLINK WHERE VIS = 'public'  ");
		sql.append(" order by index_order desc ");
		
		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
		
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				int no =rs.getInt("index_order");
				String title = rs.getString("TITLE");
				String writer = rs.getString("ID");
				int viewCnt = rs.getInt("VIEW_COUNT");
				String message = rs.getString("MESSAGE");
				String regDate = rs.getString("REG_DATE");
				BoardVO board = new BoardVO();
				board.setNo(no);
				board.setTitle(title);
				board.setWriter(writer);
				board.setViewCnt(viewCnt);
				board.setMessage(message);
				board.setRegDate(regDate);
				list.add(board);			
			}			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;		
	}
	
	public List<BoardReplyVO> selectAllReply(int no){
		List<BoardReplyVO> list = new ArrayList<BoardReplyVO>();
		
		StringBuilder sql = new StringBuilder();
		sql.append("select index_order, reply_index , reg_date , id , message");
		sql.append("  from WC_BOARD_REPLY@WCLINK WHERE index_order = ?  ");
		sql.append(" order by reply_index asc ");
		
		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			pstmt.setInt(1, no );
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {
				int no2 =rs.getInt("index_order");
				int replyNo =  rs.getInt("reply_index");
				String regDate = rs.getString("reg_date");
				String message = rs.getString("message");
				String writer = rs.getString("id");
				BoardReplyVO replyVO = new BoardReplyVO();
				replyVO.setNo(no2);
				replyVO.setWriter(writer);				
				replyVO.setReplyno(replyNo);
				replyVO.setRegDate(regDate);
				replyVO.setMessage(message);				
				list.add(replyVO);			
			}			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;		
	}
	
}
