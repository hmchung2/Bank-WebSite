package kr.ac.kopo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.kopo.member.MemberDao;
import kr.ac.kopo.member.MemberVO;

public class SignInProcessController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		System.out.println("signin process");
		String id       = request.getParameter("login_id");
		String password = request.getParameter("login_pw");
		String destination =  request.getParameter("destinationParam");
		
		MemberVO member= new MemberVO();		
		member.setId(id);
		member.setPwd(password);
		
		MemberDao dao = new MemberDao();
		MemberVO userVO = dao.signin(member);		
		String url = "";
		String msg = "";		
		HttpSession session =request.getSession();
		
		
		System.out.println("destination : " +  destination);
		
				
		if(userVO == null){
			msg = "아이디 또는 패스워드를 잘못 입력하셧습니다.";
			url = "redirect:/member/signin.do";
			session.setAttribute("msg", msg);
			if(destination != null && destination != "") {
				session.setAttribute("destination", destination);
			}
		}else{		
			msg = userVO.getName() + "님 환영합니다.";
			url = "redirect:/";
			session.setAttribute("userVO", userVO);
			if(destination != null && destination != "") {
					//url = "redirect:"+ destination;
					url = destination;
				}				
			}					
		return url;
	}
}
