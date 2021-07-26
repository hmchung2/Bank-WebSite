package kr.ac.kopo.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.board.BoardDAO;
import kr.ac.kopo.board.BoardVO;

public class ViewBoardController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		String pageStr =request.getParameter("page");
		if(pageStr == null || pageStr ==  "" ) {
			pageStr = "1";			
		}
		int page = Integer.parseInt(pageStr);
		
		
		
		BoardDAO dao = new BoardDAO();
		System.out.println("board page : " + page);
		List<BoardVO> list = dao.selectAllBoard();					
		int counts = list.size();
		if(counts > 3) {
			int pageCounts = (int) Math.ceil(  counts / 3   );		
			List<String> pageList = new ArrayList<String>();		
			for(int i = 1 ; i <= pageCounts ; i ++) {
				pageList.add( String.valueOf(i) );
			}
			System.out.println("page length : " + pageCounts);
			list = list.subList(page - 1, page - 1 + 3);
			request.setAttribute("pageList", pageList);	
		} 
		request.setAttribute("list", list);	
		
		return "/board/viewBoard.jsp";
	}
}
