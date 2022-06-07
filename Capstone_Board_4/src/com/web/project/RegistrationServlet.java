package com.web.project;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/register")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");

		String uname = request.getParameter("name");
		String uemail = request.getParameter("email");
		String upwd = request.getParameter("pass");
		String Reupwd = request.getParameter("re_pass");
		String ustudentnumber = request.getParameter("stnum");

		String st = "office.bufs.ac.kr";
		String str = uemail;
		String[] str2 = str.split("@");

		RequestDispatcher dispatcher = null;
		Connection con = null;

		if (uname == null || uname.equals("")) {
			request.setAttribute("status", "invalidName");
			dispatcher = request.getRequestDispatcher("registration.jsp");
			dispatcher.forward(request, response);
		}
		if (uemail == null || uemail.equals("")) {
			request.setAttribute("status", "invalidEmail");
			dispatcher = request.getRequestDispatcher("registration.jsp");
			dispatcher.forward(request, response);
		}

		/*
		 * if (uemail.matches(".*office.bufs.ac.kr.*") == false) {
		 * request.setAttribute("status", "containsEmail"); dispatcher =
		 * request.getRequestDispatcher("registration.jsp"); dispatcher.forward(request,
		 * response); return; }
		 */
		if (!str2[1].equals(st)) {
//			System.out.println(str2[1]);
//			System.out.println(st);
			request.setAttribute("status", "containsEmail");
			dispatcher = request.getRequestDispatcher("registration.jsp");
			dispatcher.forward(request, response);
			return;
		}

		if (upwd == null || upwd.equals("")) {
			request.setAttribute("status", "invalidUpwd");
			dispatcher = request.getRequestDispatcher("registration.jsp");
			dispatcher.forward(request, response);

		} else if (!upwd.equals(Reupwd)) {
			request.setAttribute("status", "invalidComfirmPassword");
			dispatcher = request.getRequestDispatcher("registration.jsp");
			dispatcher.forward(request, response);
		}
		if ((ustudentnumber == null || ustudentnumber.equals(""))) {
			request.setAttribute("status", "invalidStnum");
			dispatcher = request.getRequestDispatcher("registration.jsp");
			dispatcher.forward(request, response);
		} else if (ustudentnumber.length() > 9) {
			request.setAttribute("status", "invalidStnumLength"); // ?
			dispatcher = request.getRequestDispatcher("registration.jsp");
			dispatcher.forward(request, response);
			return;
		} else if (ustudentnumber.matches(".*[a-zA-z].")) {
			request.setAttribute("status", "containsinvalidStnum"); // ?
			dispatcher = request.getRequestDispatcher("registration.jsp");
			dispatcher.forward(request, response);
			return;
		}

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/youtube?useUnicode=true&characterEncoding=UTF-8&serverTimezone=Asia/Seoul&useSSL=false",
					"root", "root");
			PreparedStatement pst = con
					.prepareStatement("insert into user(uname,upwd,uemail,ustudentnumber) values(?,?,?,?)");
			pst.setString(1, uname);
			pst.setString(2, upwd);
			pst.setString(3, uemail);
			pst.setString(4, ustudentnumber);

			int rowCount = pst.executeUpdate();
			dispatcher = request.getRequestDispatcher("registration.jsp"); // ?
			
			SenddigitAction sda = new SenddigitAction();  
			sda.doPost(request, response);
			
			if (rowCount > 0) {
				request.setAttribute("status", "success");
				
			} else {
				request.setAttribute("status", "failed");
			}
			dispatcher.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	

}
