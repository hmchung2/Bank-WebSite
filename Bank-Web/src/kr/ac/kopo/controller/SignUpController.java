package kr.ac.kopo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SignUpController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");

		return "/member/signUp.jsp";				
		
	}
	public String checkNull(String result) {
		if(result != null) {
			return "true";
		} else {
			return "false";
		}
	}	
}
