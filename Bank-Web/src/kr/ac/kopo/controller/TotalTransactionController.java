package kr.ac.kopo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.kopo.account.AccountDAO;
import kr.ac.kopo.account.AccountVO;
import kr.ac.kopo.member.MemberVO;

public class TotalTransactionController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		HttpSession session =request.getSession();
		MemberVO userVO = (MemberVO) session.getAttribute("userVO");
		String url = "";
		String msg = "";
		AccountVO account = null; 
		if(userVO == null) {
			msg = "계좌 기능을 사용 하기 위해서는  <br> 우선 로그인이 필요 합니다.";
			url = "/member/signin.do";			
			// 계좌 조회 부터 다시 보내야 함
			session.setAttribute("msg", msg);
			session.setAttribute("destination",  "/bank/viewAccount.do");			
		} else {
			AccountDAO dao = new AccountDAO();
			String fromAccNum = request.getParameter("accNum");
			String fromBankName = request.getParameter("fromBankName");	
			account = dao.selectAccount(fromAccNum , fromBankName);			
			request.setAttribute("fromAcc", account);
			request.setAttribute("fromBankName", fromBankName);
			request.setAttribute("freePass", "true");
			url = "/bank/transaction.jsp";								
		}		
		return url;
	}
}
