<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.BbsDTO" %>
<%@ page import="java.io.PrintWriter" %>
<%
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%
		String userID = null; 
			// session 할당
			if(session.getAttribute("ustudentnumber") != null){
				userID = (String)session.getAttribute("ustudentnumber");
			}
			if(userID == null){ // 로그인이 되어있지 않은 경우
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 해야 작성이 가능합니다.')");
		script.println("location.href = 'login.jsp'");
		script.println("</script>");
			}
			int bbsID = 0;
			if(request.getParameter("bbsID") != null){
		bbsID = Integer.parseInt(request.getParameter("bbsID"));
			}
			if(bbsID == 0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글입니다.')");
		script.println("location.href = 'bbs.jsp'");
		script.println("</script>");
			}
			BbsDTO bbs = new BbsDAO().getBbs(bbsID);
			if(!userID.equals(bbs.getUstudentnumber())){ // 아이디가 같지 않은 경우
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('권한이 없습니다.')");
		script.println("location.href = 'bbs.jsp'");
		script.println("</script>");
			} else{
		BbsDAO bbsDAO = new BbsDAO();
			
		int result = bbsDAO.delete(bbsID);
			
		if(result == -1){ // 데이터베이스 오류 발생 시
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('글이 삭제되지 않았습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else { // 글삭제 성공
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'bbs.jsp'");
			script.println("</script>");
		}
			}
	%>
</body>
</html>