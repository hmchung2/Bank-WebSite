package kr.ac.kopo.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;



/**
 * Servlet implementation class SendTextMsgServlet
 */
@WebServlet("/SendTextMsgServlet")
public class SendTextMsgServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");

		String phoneNumber = request.getParameter("phone");
		phoneNumber = phoneNumber.replace("-", "");
		String toBankName =request.getParameter("toBankName");
		toBankName = getBankName(toBankName);		
		String amount  = request.getParameter("amount");
		String accNum = request.getParameter("fromAccNum");
		String otherAccNum = request.getParameter("toAccNum");
		String fromBankName = request.getParameter("fromBankName");
		fromBankName = getBankName(fromBankName);
		String msg = accNum  + " " + fromBankName + " 계좌 에서 " + otherAccNum +  " " + toBankName + " 은행 계좌로 "+ amount + "원이 이체 되었습니다";
		
			
		String api_key = "API 키 coolSMS 웹 사이트에 회원가입 필요";
	    String api_secret = "API 시크릿 키 coolSMS 웹 사이트에 회원가입 필요";
	    Message coolsms = new Message(api_key, api_secret);
	    // 4 params(to, from, type, text) are mandatory. must be filled
	    HashMap<String, String> params = new HashMap<String, String>();
	    params.put("to", phoneNumber);	// 수신전화번호
	    params.put("from", "01091192831");	// 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
	    params.put("type", "SMS");
	    params.put("text", msg );
	    params.put("app_version", "test app 1.2"); // application name and version
	    JSONObject obj = null;
	    try {
	      obj = (JSONObject) coolsms.send(params);
	      System.out.println(obj.toString());
	    } catch (CoolsmsException e) {
	      System.out.println(e.getMessage());
	      System.out.println(e.getCode());
	    }
		
	    PrintWriter out = response.getWriter();
	    out.write(obj.toString());		
	}
	

	public String getBankName(String code){
		String result = "";
		if(code.equals("600")){
			result= "세진저축은행";
		}else if(code.equals("800")){
			result = "MG 구마을 금고";
		}else if(code.equals("900")){
			result = "TVA";
		}else {result = "W&C";}	
		return result;
	}

}
