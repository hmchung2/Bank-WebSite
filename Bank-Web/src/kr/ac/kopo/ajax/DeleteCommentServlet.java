package kr.ac.kopo.ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.kopo.board.BoardDAO;
import kr.ac.kopo.board.BoardVO;
import kr.ac.kopo.member.MemberVO;

/**
 * Servlet implementation class DeleteCommentServlet
 */
@WebServlet("/DeleteCommentServlet")
public class DeleteCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("application/x-json; charset=UTF-8");
		System.out.println("deleting");
		String json;
		PrintWriter out = response.getWriter();
		HttpSession session =request.getSession();
		MemberVO userVO = (MemberVO) session.getAttribute("userVO");
		if(userVO == null){
			json ="{ \"result\":\"fail\" , \"msg\" : \"로그인이 필요합니다.\"   }";
		}else{
			String boardNoStr = request.getParameter("board");
			int boardNo = Integer.parseInt(boardNoStr);		
			String pw = request.getParameter("pw");
			BoardDAO boardDao = new BoardDAO();
			BoardVO board = boardDao.selectOneBoard(boardNo);	
			if( !board.getWriter().equals( userVO.getId()) )  {
				json ="{ \"result\":\"fail\" , \"msg\" : \"다른 작성자입니다..\"   }";
			}else if( ! pw.equals(userVO.getPwd())   ){
				json ="{ \"result\":\"fail\" , \"msg\" : \"비밀번호가 다릅니다...\"   }";
			} else{
				boardDao.deleteBoard(boardNo);
				json ="{ \"result\":\"success\" , \"msg\" : \"댓글이 삭제 되었습니다.\"   }";
				System.out.println("deletion success");
			}						
		}
		System.out.println(json);
		out.write(json);	
	} 
}
