<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"  %>
<%@ page import="bbs.BbsDTO"  %>
<%@ page import="bbs.BbsDAO"  %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link href="style1.css" rel="stylesheet" type="text/css"/>
<title>컴공 게시판 수정</title>
<style type="text/css">
	a, a:hover{
		color: #000000;
		text_decoration: none;
	}
	/* 사이드바 */
    .sidenav {
      background-color: #f1f1f1;
      position: fixed;
      width: 200px;
      height: 50%;
      margin-left: -20px;
      margin-top:50px
    }
    /* 본문 */
    .page {
     margin-top:50px;
     margin-left: 250px;
    }
</style>
</head>
<body>
	<%
		String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	if (userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인이 필요한 서비스입니다.')");
		script.println("location.href = 'login.jsp'");
		script.println("</script>");
	}
	int bbsID = 0;
	if (request.getParameter("bbsID") != null) {
		bbsID = Integer.parseInt(request.getParameter("bbsID"));
	}
	if (bbsID == 0) { // d
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글입니다.')");
		script.println("location.href = 'bbs.jsp'");
		script.println("</script>");
	}
	BbsDTO bbs = new BbsDAO().getBbs(bbsID);
	if (!userID.equals(bbs.getUserID())) { // 아이디가 같지 않은 경우
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('권한이 없습니다.')");
		script.println("location.href = 'bbs.jsp'");
		script.println("</script>");
	}
	%>

	<div class="container">
		<div class="top-menu">
			<div>
				<a href=""> </a>
			</div>
			<div class="login">
				<a href="logoutAction.jsp">로그아웃</a>&nbsp;&nbsp;&nbsp; <a
					href="https://www.bufs.ac.kr">home</a>
			</div>
		</div>
		<div class="header">
			<h1>
				<a href="https://www.bufs.ac.kr">BUFS</a>
			</h1>
			<nav class="main-menu">
				<ul class="upper-menu">
					<li><a href="#">학과소개</a>
						<ul class="sub-menu">
							<li><a href="#">학과장 인사말</a></li>
							<li><a href="#">학과</a></li>
							<li><a href="#">학과 연혁</a></li>
						</ul></li>
					<li><a href="#">교수진</a>
						<ul class="sub-menu">
							<li><a href="#">구성원</a></li>
						</ul></li>
					<li><a href="#">교육과정</a>
						<ul class="sub-menu">
							<li><a href="#">학부 과정</a></li>
						</ul></li>
					<li><a href="#">학생활동</a>
						<ul class="sub-menu">
							<li><a href="#">학생회</a></li>
							<li><a href="#">동아리</a></li>
						</ul></li>
					<li><a href="#">게시판</a>
						<ul class="sub-menu">
							<li><a href="#">공지사항</a></li>
						</ul></li>
				</ul>
			</nav>
		</div>
	</div>

	<div class="container-fluid">

		<!-- 사이드바 -->
		<nav class="col-sm-3 sidenav">
			<h4></h4>
			<ul class="nav nav-pills nav-stacked">
				<li><a href="#">학과 소개</a></li>
				<li><a href="#">학과장 인사말</a></li>
				<li><a href="#">학과</a></li>
				<li><a href="#">학과 연혁</a></li>
			</ul>
		</nav>
		<!-- 사이드바 끝 -->

		<!-- 본문 -->
		<div class="col-sm-9 page">
			<div class="row">
				<form method="post" action="updateAction.jsp?bbsID=<%=bbsID%>">
					<table class="table table-striped"
						style="text-aling: center; border: 1px solid #dddddd">
						<thead>
							<tr>
								<th colspan="2"
									style="background-color: #eeeeee; text-align: center;">게시판
									글수정 양식</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><input type="text" class="form-control"
									placeholder="글 제목" name="bbsTitle" maxlength="50" value=""><%=bbs.getBbsTitle()%></td>
							</tr>
							<tr>
								<td><textarea class="form-control" placeholder="글 내용"
										name="bbsContent" maxlength="2048" style="height: 350px;"><%=bbs.getBbsContent()%></textarea></td>
							</tr>
						</tbody>
					</table>
					<input type="submit" class="btn btn-primary pull-right" value="글수정">
				</form>
			</div>
		</div>
		<!-- 본문 끝 -->
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>