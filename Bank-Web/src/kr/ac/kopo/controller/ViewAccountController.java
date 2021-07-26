package kr.ac.kopo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.kopo.account.AccountDAO;
import kr.ac.kopo.account.AccountVO;
import kr.ac.kopo.member.MemberVO;

public class ViewAccountController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		HttpSession session =request.getSession();
		MemberVO userVO = (MemberVO) session.getAttribute("userVO");
		String url = "";
		String msg = "";
		if(userVO == null) {
			msg = "계좌를 확인 하기 위해서는  <br> WC 로그인이 필요 합니다.";
			url = "/member/signin.do";		
			session.setAttribute("msg", msg);
			session.setAttribute("destination",  "/bank/viewAccount.do");
		}else if(userVO.getUser_type().equals("2")) {
			session.setAttribute("msg", "카카오 유저는 사용 불가 입니다.");
			url = "/index.jsp";
		}
		
		else{
			String id = userVO.getId();
			AccountDAO dao = new AccountDAO();			
			List<AccountVO> list = dao.selectAllAccounts(id);
			request.setAttribute("list", list);
			System.out.println("got list of accounts");			
			url =  "/bank/viewAllAccount.jsp";
		}
		return url;
	}
}
