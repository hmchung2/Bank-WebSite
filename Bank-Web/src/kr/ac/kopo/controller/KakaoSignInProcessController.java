package kr.ac.kopo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.kopo.member.MemberDao;
import kr.ac.kopo.member.MemberVO;

public class KakaoSignInProcessController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");		
		String kakaoId = "#kakao_" +  request.getParameter("kakao_id");		
		String kakaoEmail = checkNull(request.getParameter("email"));
		String destination = checkNull(request.getParameter("destination"));
		System.out.println("kakao login destination : " + destination);
		
		MemberVO member= new MemberVO();
		member.setKakaoId(kakaoId);
		member.setKakaoEmail(kakaoEmail);
		String msg = "";
		String url ="";
		HttpSession session = request.getSession();
		if(kakaoEmail == null) {
			msg = "이메일 공유 항목에 체크가 필요 합니다.";
			url = "/member/signin.do";
			request.setAttribute("previous_msg", msg);
			request.setAttribute("email_valid","false" );
			return url;
		}		
		MemberDao dao = new MemberDao();		
		MemberVO userVO = null;				
			
		userVO = dao.kakaoSignIn(member);
		if (userVO == null) {
			userVO = dao.kakaoAutoSignUp(member);
			if (userVO == null) {
				msg = "로그인 중 서버 문제가 발생 했습니다.";
				url = "redirect:/member/signin.do";
				session.setAttribute("msg", msg);
				return url;
			}
		}		
		msg = userVO.getName() + "님 환영합니다.";
		if(destination != null) {
			url = "redirect:" + destination;
		}else {
			url = "redirect:/";
		}		
		session.setAttribute("userVO", userVO);				
		return url;
	}

	public String checkNull(String x) {
		if(x == "") {
			return null;
		}		
		return x;
	}
}
