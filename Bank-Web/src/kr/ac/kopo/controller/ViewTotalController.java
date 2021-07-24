package kr.ac.kopo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.kopo.account.AccountDAO;
import kr.ac.kopo.account.AccountVO;
import kr.ac.kopo.member.MemberVO;

public class ViewTotalController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		HttpSession session =request.getSession();
		MemberVO userVO = (MemberVO) session.getAttribute("userVO");
		String url = "";
		String msg = "";
		if(userVO == null) {
			msg = "통합 계좌를 확인 하기 위해서는  <br> 우선 로그인이 필요 합니다.";
			url = "/member/signin.do";		
			session.setAttribute("msg", msg);
			session.setAttribute("destination",  "/total/viewTotal.do");
		}else {		
			url = "/total/viewTotal.jsp";
		}
		return url;
	}
}
