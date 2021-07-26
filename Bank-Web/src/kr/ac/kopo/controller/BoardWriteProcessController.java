package kr.ac.kopo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.board.BoardDAO;
import kr.ac.kopo.board.BoardVO;

public class BoardWriteProcessController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");		
		String visibility = request.getParameter("visibility");
		String writerId = request.getParameter("writerId");
		String title =request.getParameter("subject");
		String message =request.getParameter("message");						
		BoardVO board = new BoardVO();
		board.setVisbility(visibility);
		board.setWriter(writerId);
		board.setTitle(title);
		board.setMessage(message);		
		BoardDAO dao = new BoardDAO();
		dao.insert(board);
		
		String url = "redirect:/board/viewBoard.do?page=1";
		return url;
	}	
}
