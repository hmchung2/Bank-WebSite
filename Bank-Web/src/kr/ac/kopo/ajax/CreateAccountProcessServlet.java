package kr.ac.kopo.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import kr.ac.kopo.account.AccountDAO;
import kr.ac.kopo.account.AccountVO;
import kr.ac.kopo.member.MemberVO;

/**
 * Servlet implementation class CreateAccount
 */
@WebServlet("/bank/CreateAccountProcess")
public class CreateAccountProcessServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");		
		HttpSession session =request.getSession();
		MemberVO userVO = (MemberVO) session.getAttribute("userVO");		//
		// needs coding here for authentication
		//
		String json;
		PrintWriter out = response.getWriter();
		
		try {
			if(userVO == null) {
				json ="{ \"fail\":\"userID\"}";
			}else {
				String userId = userVO.getId();		
				AccountVO acc = new AccountVO();		
				String nick       = request.getParameter("nickName");
				String accPwd  = request.getParameter("accountPwd");
				int initBal = Integer.parseInt(request.getParameter("initBal"));		
				int maxVal = 0 ;
				String maxOptV =  request.getParameter("maxOpt");
				String maxOpt;
				if(maxOptV.equals("true" ) ) {
					maxOpt = "T";
					maxVal = Integer.parseInt(request.getParameter("maxVal")) ;
				}else{
					maxOpt ="F";			
				}
				String openOptV =  request.getParameter("openOpt");
				String openOpt;
				if(openOptV.equals("true") ) {
					openOpt = "T";
				}else {
					openOpt = "F";
				}
	

				acc.setNick(nick);
				acc.setId(userId);
				acc.setAccPwd(accPwd);
				acc.setMaxOpt(maxOpt);
				acc.setMaxVal(maxVal);
				acc.setOpenOpt(openOpt);
				acc.setAccBalance(initBal);
				
				Boolean successGenerate = true;
				Boolean currentLoop = true;
				String newAccNum;
				int cnt = 0;
				AccountDAO dao = new AccountDAO();		
				while(currentLoop) {
					newAccNum = generateDigits();
					currentLoop = dao.checkSameAcc(newAccNum);			
					cnt++;
					if(cnt == 50 ) {
						successGenerate = false;
						break;
					}
					acc.setAccNum(newAccNum);						
				}			
				if(successGenerate ) {					
					boolean insertResult = dao.createAcc(acc);
					if(insertResult) {
						Gson gson = new Gson();			
						json = gson.toJson(acc);		
					}else {
						json ="{ \"fail\":\"insert\"}";
					}						
				}else {
					json ="{ \"fail\":\"accNum\"}";
				}		
			}
		}catch (Exception e) {
			e.printStackTrace();
			json ="{ \"fail\":\"unknown\"}";
		}		
		out.write(json);
	}
	
	public String generateDigits() { 
	    Random rnd = new Random();
	    char [] digits = new char[7];
	    digits[0] = (char) (rnd.nextInt(9) + '1');
	    for(int i=1; i<digits.length; i++) {
	        digits[i] = (char) (rnd.nextInt(10) + '0');
	    }
	    return "700" +   String.valueOf(Long.parseLong(new String(digits)) ) ;  
	}
	

}
