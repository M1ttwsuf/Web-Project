package com.web.project;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/ValidateOtp")
public class ValidateOtp extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int value = Integer.parseInt(request.getParameter("otp"));
		HttpSession session = request.getSession();
		int otp = (int) session.getAttribute("otp");
		

		RequestDispatcher dispatcher = null;
		

		if (value == otp) { // result = otp이면 -> 확인 클릭 -> 

			request.setAttribute("email", request.getParameter("email"));
			request.setAttribute("status", "success");
			dispatcher = request.getRequestDispatcher("newPassword.jsp"); // 회원가입 완료 login.jsp로 이동
			dispatcher.forward(request, response);

		} else {
			request.setAttribute("message", "wrong otp");

			dispatcher = request.getRequestDispatcher("EnterOtp.jsp");
			dispatcher.forward(request, response);

		}

	}

}
