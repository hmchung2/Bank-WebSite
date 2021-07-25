package kr.ac.kopo.board;

import java.sql.Connection;
import java.sql.PreparedStatement;

import kr.ac.kopo.util.ConnectionFactory;

public class BoardDAO {
	
	public void insert(BoardVO board) {

		StringBuilder sql = new StringBuilder();
		sql.append("insert into wc_board@wclink( ID , TITLE , VIEW_COUNT, VIS , MESSAGE  ) ");		
		sql.append(" values(?, ?, ?, ? , ? , ?) ");

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			int loc = 1;
			pstmt.setString(loc++, board.getWriter());
			pstmt.setString(loc++, board.getTitle());
			pstmt.setInt(loc++, 1 );
			pstmt.setString(loc++, board.getVisbility());
			pstmt.setString(loc++, board.getMessage());
			pstmt.executeUpdate();						
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
