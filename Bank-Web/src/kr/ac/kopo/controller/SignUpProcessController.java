package kr.ac.kopo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.member.MemberDao;
import kr.ac.kopo.member.MemberVO;

public class SignUpProcessController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		MemberDao dao = new MemberDao();
		MemberVO newMember = new MemberVO();
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

		String id = request.getParameter("id_id");
		String pwd = request.getParameter("pw1");
		String name = request.getParameter("last-name") + request.getParameter("first-name") ;
		String ssn  = request.getParameter("ssn");
		String phone = request.getParameter("threeDigits") + request.getParameter("phone");
		String email = request.getParameter("str_email01") + "@" + request.getParameter("str_email02");
		
		newMember.setId(id);
		newMember.setOpt1(opt1);
		newMember.setOpt2(opt2);
		newMember.setPwd(pwd);
		newMember.setName(name);
		newMember.setSsn(ssn);
		newMember.setPhone(phone);
		newMember.setEmail(email);
		
		Boolean result = dao.signUp(newMember);
		String url = result ?  "/member/signin.do" : "/index.jsp";		
		return url;
	}
}
