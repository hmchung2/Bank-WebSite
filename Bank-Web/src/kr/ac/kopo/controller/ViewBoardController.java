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
		System.out.println("size: " + counts);
		if(counts > 3) {
			int pageCounts = (int) Math.ceil((double)  counts / 3   );		
			if(page > pageCounts ){
				page = pageCounts;
			}
			
			System.out.println("pageCounts : " + pageCounts);
			
			List<String> pageList = new ArrayList<String>();		
			for(int i = 1 ; i <= pageCounts ; i ++) {
				pageList.add( String.valueOf(i) );
			}
			
			System.out.println("page list length : "  + pageList.size() );
			int lastPage = (page - 1)*3 + 3 > counts ? counts  :  (page - 1)*3 + 3 ;
			
			list = list.subList((page - 1)*3, lastPage);
			request.setAttribute("pageList", pageList);	
		} 
		request.setAttribute("list", list);	
		
		return "/board/viewBoard.jsp";
	}
}
