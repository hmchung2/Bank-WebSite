package kr.ac.kopo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.kopo.member.MemberDao;
import kr.ac.kopo.member.MemberVO;
import kr.ac.kopo.member.TotalMemberVO;

public class TotalSignUpProcessController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		MemberDao dao = new MemberDao();
		TotalMemberVO newMember = new TotalMemberVO();
		String opt1;
		String opt2;
		if( request.getParameter("opt1") != null   ) {			
			opt1 = "T";
		} else {
			opt1 = "F";
		}
		if(  request.getParameter("opt2") != null  ) {
			opt2 = "T";
		} else {
			opt2 = "F";			
		}
		HttpSession session =request.getSession();
		
		MemberVO userVO = (MemberVO) session.getAttribute("userVO");
		
		String id =  userVO.getId();
		String totalId = request.getParameter("id_id");
		String totalPwd = request.getParameter("pw1");
		String totalNick =request.getParameter("totalNick");
		newMember.setTotalId(totalId);
		newMember.setId(id);
		newMember.setTotalNick(totalNick);
		newMember.setTotalPwd(totalPwd);
		newMember.setOpt1(opt1);
		newMember.setOpt2(opt2);
		String url = "/total/viewTotal.do";
		String msg;
		Boolean result = dao.totalSignUp(newMember);
		if(result == false) {			
			msg ="통합계좌를 만드는데 있어서 문제가 발생 했습니다.";
			session.setAttribute("msg", msg);
		}else {
			msg ="통합계좌 생성 완료 되었습니다.";
			session.setAttribute("msg", msg);			
		}
		return url;
	}
}
