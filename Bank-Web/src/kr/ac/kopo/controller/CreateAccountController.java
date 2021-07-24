package kr.ac.kopo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.kopo.member.MemberVO;

public class CreateAccountController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub		
		request.setCharacterEncoding("utf-8");
		HttpSession session =request.getSession();
		MemberVO userVO = (MemberVO) session.getAttribute("userVO");
		String url = "";
		String msg = "";
		if(userVO == null) {
			msg = "계좌를 개설 하기 위해서는  <br> 우선 로그인이 필요 합니다.";
			url = "/member/signin.do";		
			session.setAttribute("msg", msg);
			session.setAttribute("destination",  "/bank/createAccount.do");
		}else {
			url =  "/bank/createAccount.jsp";
		}
		return url;
	}
}
