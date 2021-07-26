package kr.ac.kopo.ajax;

import java.io.BufferedWriter;
import java.io.IOException;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.ac.kopo.board.BoardDAO;
import kr.ac.kopo.board.BoardReplyVO;

/**
 * Servlet implementation class ShowReply
 */
@WebServlet("/ShowReply")
public class ShowReply extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");		
		PrintWriter out = response.getWriter();			
		BoardDAO dao = new BoardDAO();
		String indexStr = request.getParameter("index");
		int index = Integer.parseInt(indexStr);
		List<BoardReplyVO> list =  dao.selectAllReply(index);
	
		
		Gson gson = new Gson();
		String data  = gson.toJson(list);
		out.write(data);

	}

}
