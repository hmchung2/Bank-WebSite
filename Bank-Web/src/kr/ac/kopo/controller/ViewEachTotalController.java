package kr.ac.kopo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.kopo.account.AccountDAO;
import kr.ac.kopo.account.TotalAccountVO;
import kr.ac.kopo.member.MemberDao;
import kr.ac.kopo.member.MemberVO;
import kr.ac.kopo.member.TotalMemberVO;

public class ViewEachTotalController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		HttpSession session =request.getSession();
		MemberVO userVO = (MemberVO) session.getAttribute("userVO");
		
		String url = "";
		String msg = "";
		String totalId = request.getParameter("totalId");
		String totalPwd = request.getParameter("totalPwd");
		String totalNick =request.getParameter("totalNick");
		String id = userVO.getId();		
		MemberDao dao = new MemberDao();
		Boolean result = dao.validateTotalUser(totalId, totalPwd, id );
		if(result == false) {
			msg ="비밂번호 올바르지 않습니다.";
			session.setAttribute("msg", msg);
			url = "/total/viewTotal.do";
		} else {
			url = "/total/viewEachTotal.jsp";
			request.setAttribute("totalNick", totalNick );
			request.setAttribute("totalId", totalId  );
			AccountDAO accDao = new AccountDAO();			
			List<TotalAccountVO> list = accDao.selectAllTotalAccounts(totalId);
			request.setAttribute("list", list);
		}		
		return url;
	}
}
