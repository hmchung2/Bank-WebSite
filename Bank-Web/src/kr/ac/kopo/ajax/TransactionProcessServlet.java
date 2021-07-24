package kr.ac.kopo.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import kr.ac.kopo.account.AccountDAO;
import kr.ac.kopo.account.AccountVO;
import kr.ac.kopo.member.MemberVO;

/**
 * Servlet implementation class TransactionProcessServlet
 */
@WebServlet("/bank/transactionProcess")
public class TransactionProcessServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("utf-8");		
		HttpSession session =request.getSession();
		MemberVO userVO = (MemberVO) session.getAttribute("userVO");		//
		// needs coding here for authentication
		//
		String json ;
		
		PrintWriter out = response.getWriter();
		try {
			if(userVO == null) {
				json ="{ \"result\":\"false\"}";
			}else {
				String myAccNum = request.getParameter("fromAccNum");
				String toAccNum = request.getParameter("toAccNum");
				String fromBankName = request.getParameter("fromBankName");
				String toBankName = request.getParameter("toBankName");
				int amount = Integer.parseInt(request.getParameter("amount"));				
				int fromPreBal = Integer.parseInt(request.getParameter("fromPreBalance"));
				int toPreBal = Integer.parseInt(request.getParameter("toPreBalance"));
				System.out.println(myAccNum);
				System.out.println(toAccNum);
				System.out.println(fromBankName);
				System.out.println(toBankName);
				System.out.println(amount);
				System.out.println(fromPreBal);
				System.out.println(toPreBal);
				
				//AccountVO fromAccVO = (AccountVO) request.getAttribute("fromAccVO");
//	public Map<String, String> transaction(String fromBankName ,  String fromAccNum , String toBankName , String toAccNum  , int amount , int fromPreBal , int toPreBal ){
				AccountDAO dao = new AccountDAO();
				
				
				

				Map<String,String> result = dao.transaction(fromBankName, myAccNum, toBankName, toAccNum, amount, fromPreBal, toPreBal);
				Gson gson = new Gson();
				json = gson.toJson(result);
				
				
				
			}			
		} catch (Exception e) {
			// TODO: handle exception
			json ="{ \"result\":\"false\"}";
			e.printStackTrace();
		}
		out.write(json);
	}	
}
