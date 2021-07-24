package kr.ac.kopo.ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.json.JSONParser;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import kr.ac.kopo.account.AccountDAO;
import kr.ac.kopo.account.AccountVO;
import kr.ac.kopo.member.MemberVO;

/**
 * Servlet implementation class FindAccountServlet
 */
@WebServlet("/bank/findAccount")
public class FindAccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");		
		PrintWriter out = response.getWriter();
		String json;
		try {
			String bankName = request.getParameter("bankName");
			String accNum = request.getParameter("accNum");
			
			AccountDAO dao = new AccountDAO();
			
			AccountVO accountVO = dao.selectAccount(accNum , bankName);
			if(accountVO == null) {
				json ="{ \"result\":\"false\"}";
			}else {
				Gson gson = new Gson();
				System.out.println(accountVO.toString());
				json = gson.toJson(accountVO);
				System.out.println(json);
			}						
		} catch (Exception e) {
			// TODO: handle exception
			json ="{ \"result\":\"false\"}";
			e.printStackTrace();
		}
		out.write(json);
	}

}
