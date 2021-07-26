package kr.ac.kopo.ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.kopo.member.MemberVO;

import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;



/**
 * Servlet implementation class SendEmailServlet
 */
@WebServlet("/SendEmailServlet")
public class SendEmailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	  	private static String USER_NAME = "hmchung2@gmail.com";  // GMail user name (just the part before "@gmail.com")
	    private static String PASSWORD = "Incep&8133"; // GMail password
	
	
	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  // Recipient's email ID needs to be mentioned.
		response.setContentType("text/html; charset=utf-8");		

	      	HttpSession session2 =request.getSession();
	      	MemberVO userVO = (MemberVO) session2.getAttribute("userVO");		//
		  	String to2 = userVO.getEmail();
		  
		  	String RECIPIENT = to2;

		  	
		  	String from = USER_NAME;
	        String pass = PASSWORD;
	        String[] to = { RECIPIENT }; // list of recipient email addresses
	        String subject = "transaction completed";
	        String body = "transaction completed";

	        sendFromGMail(from, pass, to, subject, body); 
			PrintWriter out = response.getWriter();
			out.write("{ \"result\" :  \" " + "true" + " \"  } "  );

	        
	        
	}

    private static void sendFromGMail(String from, String pass, String[] to, String subject, String body) {
        Properties props = System.getProperties();
        String host = "smtp.gmail.com";
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.user", from);
        props.put("mail.smtp.password", pass);
        props.put("mail.smtp.port", "9997");
        props.put("mail.smtp.auth", "true");

        Session session = Session.getDefaultInstance(props);
        MimeMessage message = new MimeMessage(session);

        try {
            message.setFrom(new InternetAddress(from));
            InternetAddress[] toAddress = new InternetAddress[to.length];

            // To get the array of addresses
            for( int i = 0; i < to.length; i++ ) {
                toAddress[i] = new InternetAddress(to[i]);
            }

            for( int i = 0; i < toAddress.length; i++) {
                message.addRecipient(Message.RecipientType.TO, toAddress[i]);
            }

            message.setSubject(subject);
            message.setText(body);
            Transport transport = session.getTransport("smtp");
            transport.connect(host, from, pass);
            transport.sendMessage(message, message.getAllRecipients());
            transport.close();
        }
        catch (AddressException ae) {
            ae.printStackTrace();
        }
        catch (MessagingException me) {
            me.printStackTrace();
        }
    }
} 
