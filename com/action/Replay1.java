package com.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class Replay1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public Replay1() {
        super();
        // TODO Auto-generated constructor stub
    }
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	}
	public void destroy() {
		// TODO Auto-generated method stub
	}
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		HttpSession sess=request.getSession(false);
		String to =request.getParameter("Umail");
		String page=request.getParameter("page");
		System.out.println("massage send to "+to);
		System.out.println("the massage are "+request.getParameter("massage"));
		if(request.getParameter("massage")==null)
		{
			System.out.println("if block of reply");
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
			return;
			
		}
			
		System.out.println("the subject are "+request.getParameter("subject"));
		// Sender's email ID needs to be mentioned
		String from = "etutin123@gmail.com";
		final String username ="etution123@gmail.com";// change accordingly
		final String password ="etution@cdac";// change accordingly

		// Assuming you are sending email through relay.jangosmtp.net
		String host = "smtp.gmail.com";

		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.socketFactory,class","javax.net.ssl.+");
		// props.put("mail.smtp.starttls.enable", "false");
		props.put("mail.smtp.starttls.enable", "true");
		
		props.put("mail.smtp.port", "587");
		props.put("mail.smtp.user", username);

		// Get the Session object.
		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});

		try {
			// Create a default MimeMessage object.
			Message message = new MimeMessage(session);

			// Set From: header field of the header.
			message.setFrom(new InternetAddress(from));

			// Set To: header field of the header.
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));

			// Set Subject: header field
			message.setSubject("mail by etution admin");

			// Now set the actual message
			message.setText(request.getParameter("massage"));
			Transport.send(message);

			System.out.println("Sent message successfully....");
			PrintWriter p=response.getWriter();
			p.print("<script>alert('message send successfully')</script>");
			
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.include(request, response);

		} catch (Exception e) {
			e.printStackTrace();
			PrintWriter p=response.getWriter();
			p.print("<script>alert('message send fail')</script>");
			
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.include(request, response);

		}

	
	}

}
