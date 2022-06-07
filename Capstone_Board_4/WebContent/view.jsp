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
<title>컴공 게시판 보기</title>
<style type="text/css">
	a, a:hover{
		color: #000000;
		text_decoration: none;
	}
	/* 사이드바 */
    .sidenav {
      background-color: #fff;
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
	<% // 아래도 양식 맞춰 바꿔줄 예정
		String userID = null;
			if(session.getAttribute("ustudentnumber") != null){
		userID = (String)session.getAttribute("ustudentnumber");
			}
			int bbsID = 0;
			if(request.getParameter("bbsID") != null){
		bbsID = Integer.parseInt(request.getParameter("bbsID"));
			}
			if(bbsID == 0){
		PrintWriter script = response.getWriter();
		script.println("<script");
		script.println("alert('유효하지 않은 글입니다.')");
		script.println("</script>");
			}
			BbsDTO bbs = new BbsDAO().getBbs(bbsID);
	%>
	<div class="container">
		<div class="top-menu">
			<div>
				<a href=""> </a>
			</div>
			<%
				if(userID == null){
			%>
			<div class="login"> <!-- 로그인 페이지 바꿔줘야지 -->
				<a href="login.jsp">로그인</a>&nbsp;&nbsp;&nbsp; <a
					href="https://www.bufs.ac.kr">home</a>
			</div>
		</div>
		<%
	       	} else{
	       %>
		<div class="login"> <!-- 로그아웃 페이지 바꿔주고 -->
			<a href="logoutAction.jsp">로그아웃</a>&nbsp;&nbsp;&nbsp; <a
				href="https://www.bufs.ac.kr">home</a>
		</div>
	</div>
	<%
				}
			%>

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
	<div class="container-fluid">

		<!-- 사이드바 -->
		<nav class="col-sm-3 sidenav" style="margin-left:2%">
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
			<div class="container">
				<div class="row">
					<table class="table table-striped"
						style="text-aling: center; border: 1px solid #dddddd">
						<thead>
							<tr>
								<th colspan="3"
									style="background-color: #eeeeee; text-align: center;">게시판
									글보기</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td style="width: 20%;">글 제목</td>
								<td colspan="2"><%= bbs.getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td>
							</tr>
							<tr>
								<td>작성자</td>
								<td colspan="2"><%= bbs.getUstudentnumber() %></td>
							</tr>
							<tr>
								<td>작성일자</td>
								<td colspan="2"><%= bbs.getBbsDate().substring(0, 11) + bbs.getBbsDate().substring(11, 13) + "시" + bbs.getBbsDate().substring(14, 16) + "분" %></td>
							</tr>
							<tr>
								<td>내용</td>
								<td colspan="2" style="min-height: 200px; text-align: left;"><%= bbs.getBbsContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td>
							</tr>
						</tbody>
					</table>
					<a href="bbs.jsp" class="btn btn-primary">목록</a>
			<%
				if(userID != null && userID.equals(bbs.getUstudentnumber())){
			%>
					<a href="update.jsp?bbsID=<%= bbsID %>" class="btn btn-primary">수정</a>
					<a onclick="return confirm('삭제하시겠습니까?')"
						href="deleteAction.jsp?bbsID=<%= bbsID %>" class="btn btn-primary">삭제</a>
			<%
				}
			%>
				</div>
			</div>
		</div>
	</div>
		<!-- 본문 끝 -->

		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		<script src="js/bootstrap.js"></script>
</body>
</html>