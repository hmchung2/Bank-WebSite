package kr.ac.kopo.ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.ac.kopo.account.AccountDAO;
import kr.ac.kopo.member.MemberVO;

/**
 * Servlet implementation class GetUserInfoServlet
 */
@WebServlet("/bank/UserInfo")
public class GetUserInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       


	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=utf-8");		
		String userId = request.getParameter("userId");
		String bankName = request.getParameter("bankName");
		System.out.println(userId);
		System.out.println(bankName);
		AccountDAO dao = new AccountDAO();
		MemberVO memberVO = dao.getUserByID(userId , bankName );		
		Gson gson = new Gson();
		String json = gson.toJson(memberVO);		
		PrintWriter out = response.getWriter();
		out.write(json);		
	}

}
