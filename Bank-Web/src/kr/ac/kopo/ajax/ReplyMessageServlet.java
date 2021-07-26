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
import kr.ac.kopo.board.BoardReplyVO;
import kr.ac.kopo.member.MemberVO;

/**
 * Servlet implementation class ReplyMessageServlet
 */
@WebServlet("/Board/Reply")
public class ReplyMessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("ok");
		response.setContentType("application/x-json; charset=UTF-8");

		HttpSession session =request.getSession();
		MemberVO userVO = (MemberVO) session.getAttribute("userVO");		//
		String json;		
		PrintWriter out = response.getWriter();
		try {
			if(userVO == null) {
				json ="{ \"result\":\"false\"}";
			}else {
				String indexStr = request.getParameter("index");
				int index = Integer.parseInt(indexStr);
				String message = request.getParameter("message");
				
				
				BoardReplyVO replyVO = new BoardReplyVO();
				replyVO.setWriter( userVO.getId() );
				replyVO.setMessage(message);
				replyVO.setNo(index);
				BoardDAO dao = new BoardDAO();
				dao.insertReply(replyVO);
				json ="{ \"result\":\"true\"}";				
			}			
		}catch (Exception e) {
			json ="{ \"result\":\"false\"}";
			e.printStackTrace();
		}
		out.write(json);		
	}

}
