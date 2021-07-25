package kr.ac.kopo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.board.BoardVO;

public class BoardWriteProcessController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub		
		String visibility = request.getParameter("visibility");
		String writerId = request.getParameter("writerId");
		String title =request.getParameter("subject");
		String message =request.getParameter("message");				
		String replyStr = request.getParameter("reply");
		int reply;
		if(replyStr == null) {
			reply = -1;
		}else {
			reply = Integer.parseInt(replyStr);
		}
		BoardVO board = new BoardVO();
		board.setVisbility(visibility);
		board.setWriter(writerId);
		board.setTitle(title);
		board.setMessage(message);
		String url = "redirect:/board/viewBoard.do?page=1";
		return url;
	}	
}
