package kr.ac.kopo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.kopo.member.MemberDao;
import kr.ac.kopo.member.MemberVO;

public class UpdateUserInfoProcessController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("utf-8");
		String newPwd = request.getParameter("login_pw2");
		MemberDao dao = new MemberDao();		
		HttpSession session =request.getSession();
		MemberVO userVO = (MemberVO) session.getAttribute("userVO");
		userVO.setPwd(newPwd);
		dao.updatePwd(userVO);
		session.removeAttribute("userVO");
		session.setAttribute("msg", "회원 정보 수정 완료");								
		return "redirect:/";		
	}
}
