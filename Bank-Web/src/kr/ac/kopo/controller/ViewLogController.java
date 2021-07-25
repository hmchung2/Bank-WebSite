package kr.ac.kopo.controller;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.account.LogDAO;
import kr.ac.kopo.account.LogVO;

public class ViewLogController implements Controller{
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		
		String days = request.getParameter("days");
		String accNum = request.getParameter("accNum");		
		LogDAO dao = new LogDAO();
		List<LogVO> list ;
		if(days.equals("all")) {
			list = dao.selectLogs(accNum);
		}else {
			list = dao.selectLogs(accNum, days);
		}
		request.setAttribute("list" , list);		
		return  "/bank/viewLogs.jsp";
	}
	
}
