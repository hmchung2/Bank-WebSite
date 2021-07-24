package kr.ac.kopo.ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.kopo.account.AccountDAO;
import kr.ac.kopo.account.AccountVO;
import kr.ac.kopo.member.MemberVO;

/**
 * Servlet implementation class RegisterAccToTotal
 */
@WebServlet("/total/RegisterAccToTotal")
public class RegisterAccToTotalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		String json = null;
		PrintWriter out = response.getWriter();
		String bankName = request.getParameter("bankName");
		System.out.println(bankName);
		String accNum = request.getParameter("accNum");
		String accPwd = request.getParameter("accPwd");
		String totalId = request.getParameter("totalId");
		
		HttpSession session =request.getSession();
		MemberVO userVO = (MemberVO) session.getAttribute("userVO");
		String ssn = userVO.getSsn();		
		AccountDAO dao = new AccountDAO();
		AccountVO account = dao.selectAccount(accNum , bankName);
		try {
			if(account == null) {
				json ="{ \"result\":\"계좌번호를 조회 할 수 없습니다.\"}";	
			}else if(accPwd != account.getAccPwd()) {
				json ="{ \"result\":\"비밀번호가 일치 하지 않습니다.\"}";			
			}else {
				MemberVO accountUser = dao.getUserByID(accPwd, bankName);
				if(accountUser.getSsn() != ssn  ) {
					json ="{ \"result\":\"주민등록 번호가 틀렸습니다..\"}";			
				}else {
					if( dao.insertTotalAccount(account, bankName, totalId) ) {
						json = "{ \"result\":\"true\"}";				
					}else {
						json = "{ \"result\":\"아이디가 이미 존재 합니다.\"}";	
					}	
				}
			}
		} catch (Exception e) {
			json = "{ \"result\":\"알수 없는 문제가 발생 했습니다.\"}";	
		}
		
		
		out.write(json);
	}
}
