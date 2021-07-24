package kr.ac.kopo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SignInController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession(true);
		String msg = (String) session.getAttribute("msg");
		session.removeAttribute("msg");
		request.setAttribute("previous_msg", msg);
		
		String destination = (String) session.getAttribute("destination");
		session.removeAttribute("destination");
		request.setAttribute("destination", destination);		
		// TODO Auto-generated method stub
		
		return "/member/signIn.jsp";
	}
}
