<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<body>
	<%
		String userID = null;
		if(session.getAttribute("ustudentnumber") != null){
		userID = (String)session.getAttribute("ustudentnumber");
			}
	%>
	<div class="container">
		<div class="top-menu">
	          <div>
	            <a href="">  </a>
	          </div>
			<%
				if(userID == null){
			%>
			<div class="login">
	            <a href="login.jsp">로그인</a>&nbsp;&nbsp;&nbsp;
	            <a href="https://www.bufs.ac.kr">home</a>
	         </div>
	       <%
	       	} else{
	       %>
			<div class="login">
	            <a href="logoutAction.jsp">로그아웃</a>&nbsp;&nbsp;&nbsp;
	            <a href="https://www.bufs.ac.kr">home</a>
	        </div>
			<%
				}
			%>
			</div>
			<div class="header">
	          <h1><a href="https://www.bufs.ac.kr">BUFS</a></h1>
	          <nav class="main-menu">
	            <ul class="upper-menu">
	              <li><a href="#">학과소개</a>
	                <ul class="sub-menu">
	                  <li><a href="#">학과장 인사말</a></li>
	                  <li><a href="#">학과</a></li>
	                  <li><a href="#">학과 연혁</a></li>
	                </ul>
	              </li>
	              <li><a href="#">교수진</a>
	                <ul class="sub-menu">
	                  <li><a href="#">구성원</a></li>
	                </ul>
	              </li>
	              <li><a href="#">교육과정</a>
	                <ul class="sub-menu">
	                  <li><a href="#">학부 과정</a></li>
	                </ul>
	              </li>
	              <li><a href="#">학생활동</a>
	                <ul class="sub-menu">
	                  <li><a href="#">학생회</a></li>
	                  <li><a href="#">동아리</a></li>
	                </ul>
	              </li>
	              <li><a href="bbs.jsp">게시판</a>
	                <ul class="sub-menu">
	                  <li><a href="bbs.jsp">공지사항</a></li>
	                </ul>
	              </li>
	            </ul>   
	          </nav>     
	        </div>
	</div>