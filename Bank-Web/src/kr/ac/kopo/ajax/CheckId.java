package kr.ac.kopo.ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.member.MemberDao;

/**
 * Servlet implementation class CheckId
 */
@WebServlet("/ajax/checkId")
public class CheckId extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");		
		PrintWriter out = response.getWriter();

		MemberDao dao = new MemberDao();
		String chkId = request.getParameter("chkId");
		String result = dao.checkId(chkId);		
		out.write("{ \"chkId\" : \"  " + chkId + " \" , \"result\" :  \" " + result + " \"  } "  );
			
	}	
}
