<%-- <%
if (session.getAttribute("name") == null) {
	response.sendRedirect("login.jsp");
}
%> --%>
<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>BUFS</title>
<link href="style.css" rel="stylesheet" type="text/css" />
</head>

<body>
	<div class="container">
		<div class="top-menu">
			<div>
				<a href=""> </a>
			</div>
			<div class="login">
				<!-- <a href="login.jsp"> 로그인</a> -->
				<%
				if (session.getAttribute("name") != null) {
				%>
				<a href="logout"> 로그아웃 <%=session.getAttribute("name")%></a>
				<%
				} else if (session.getAttribute("name") == null) {
				%>
				<a href="login.jsp"> 로그인 </a>
				<%
				}
				%>

				<a href="https://www.bufs.ac.kr">Home</a>
			</div>
		</div>
		<div class="header">
			<h1>
				<a href="https://www.bufs.ac.kr">BUFS</a>
			</h1>
			<nav class="main-menu">
				<ul class="upper-menu">
					<li><a
						href="file:///C:/Users/이동호/Desktop/캡스톤디자인/gwaje1%20(2)/index1.html#">학과소개</a>
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
		<div class="hero">
			<h2>컴퓨터 공학과</h2>
			<p>COMPUTER SCIENCE AND ENGINEERING</p>
			<button>View More</button>
		</div>
	</div>

	<div class="middle">
		<nav class="section">
			<h3>NEWS</h3>
			<a href="#" class="more">MORE</a>
			<ul>
				<li><a href="#">컴퓨터공학과 공지사항</a> <span class="date">2020.05.15</span>
				</li>
				<li><a href="#">컴퓨터공학과 공지사항2</a> <span class="date">2020.05.15</span>
				</li>
				<li><a href="#">컴퓨터공학과 공지사항3</a> <span class="date">2020.05.15</span>
				</li>
				<li><a href="#">컴퓨터공학과 공지사항4</a> <span class="date">2020.05.15</span>
				</li>
			</ul>
		</nav>
		<nav class="section-b">
			<table>
				<tr>
					<th colspan="2">NOTICE</th>
				</tr>
				<tr>
					<td><a href="#">학교공지사항</a></td>
					<td><a href="#">학과공지사항</a></td>
				</tr>
			</table>
		</nav>
	</div>

	<div class="footer">
		<div class="foot">
			<p>
				부산광역시 금정구 금샘로 485번길 65(남산동) <br> 비즈니스텍센터 i 416호 <br>
				연락처:051)509-6221 FAX:051)509-6260
			</p>

		</div>
	</div>



</body>

</html>