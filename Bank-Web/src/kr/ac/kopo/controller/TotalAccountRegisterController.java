package kr.ac.kopo.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.kopo.account.AccountDAO;
import kr.ac.kopo.account.AccountVO;
import kr.ac.kopo.account.TotalAccountVO;
import kr.ac.kopo.member.MemberVO;

public class TotalAccountRegisterController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		String msg;
		String bankName = request.getParameter("bankSelect");
		System.out.println(bankName);
		String accNum = request.getParameter("accNum");
		String accPwd = request.getParameter("accPwd");
		String totalId = request.getParameter("totalId");
		String totalNick = request.getParameter("totalNick");
		HttpSession session = request.getSession();
		MemberVO userVO = (MemberVO) session.getAttribute("userVO");
		String ssn = userVO.getSsn();
		AccountDAO dao = new AccountDAO();
		try {
			AccountVO account = dao.selectAccount(accNum, bankName);
			if (account == null) {
				msg = "계좌번호를 조회 할 수 없습니다.";
			} else if (!accPwd.equals(account.getAccPwd() )  ) {
				System.out.println(accPwd);
				System.out.println(account.getAccPwd());
				msg = "비밀번호가 일치 하지 않습니다.";
			} else {
				MemberVO accountUser = dao.getUserByID(account.getId() , bankName);
				if (!ssn.equals(accountUser.getSsn() ) ) {
					msg = "주민등록 번호가 틀렸습니다.";
				} else {
					if (dao.insertTotalAccount(account, bankName, totalId)) {
						msg = "true";
					} else {
						msg = "아이디가 이미 존재 합니다.";
					}
				}
			}
		} catch (Exception e) {
			msg = "알수 없는 문제가 발생 했습니다.";
			e.printStackTrace();
		}
		request.setAttribute("previous_msg", msg);
		request.setAttribute("totalNick", totalNick);
		request.setAttribute("totalId", totalId);
		List<TotalAccountVO> list = dao.selectAllTotalAccounts(totalId);
		request.setAttribute("list", list);
		return "/total/viewEachTotal.jsp";
	}
}
