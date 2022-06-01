<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"  %>
<%@ page import="bbs.BbsDAO"  %>
<%@ page import="bbs.BbsDTO"  %>
<%@ page import="java.util.ArrayList"  %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link href="style1.css" rel="stylesheet" type="text/css"/>

<title>컴공 게시판</title>
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
		int pageNumber = 1;
			String userID = null;
			if(session.getAttribute("userID") != null){
		userID = (String)session.getAttribute("userID");
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
	       </div>
	       <%
	       	} else{
	       %>
			<div class="login">
	            <a href="logoutAction.jsp">로그아웃</a>&nbsp;&nbsp;&nbsp;
	            <a href="https://www.bufs.ac.kr">home</a>
	          </div>
	       </div>
			<%
				}
			%>
		
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
	              <li><a href="#">게시판</a>
	                <ul class="sub-menu">
	                  <li><a href="#">공지사항</a></li>
	                </ul>
	              </li>
	            </ul>   
	          </nav>     
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
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">작성자</th>
						<th style="background-color: #eeeeee; text-align: center;">작성일</th>
					</tr>
				</thead>
				<tbody>
					<%
						BbsDAO bbsDAO = new BbsDAO();
									ArrayList<BbsDTO> list = bbsDAO.getList(pageNumber);
									for(int i = 0; i< list.size(); i++){
					%>
					<tr>
						<td><%= list.get(i).getBbsID() %></td>
						<td><a href="view.jsp?bbsID=<%= list.get(i).getBbsID() %>"><%= list.get(i).getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></a></td>
						<td><%= list.get(i).getUserID() %> </td>
						<td><%= list.get(i).getBbsDate().substring(0, 11) + list.get(i).getBbsDate().substring(11, 13) + "시" + list.get(i).getBbsDate().substring(14, 16) + "분" %></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
			<%
				if(pageNumber != 1){
			%>
				<a href="bbs.jsp?pageNumber=<%=pageNumber + 1 %>" class="btn btn-success btn-arraw-left">이전</a>
			<%
				}
				if(bbsDAO.nextPage(pageNumber + 1)) {
			%>
				<a href="bbs.jsp?pageNumber=<%=pageNumber + 1 %>" class="btn btn-success btn-arraw-left">다음</a>
			<%
				}
			%>
			<a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>
		</div>
    </div>
    <!-- 본문 끝 -->
 
</div>

<footer class="container-fluid navbar-fixed-bottom">
    <div class="footer">
        <div class="foot">
          <p>부산광역시 금정구 금샘로 485번길 65(남산동) <br> 비즈니스텍센터 i 416호 <br> 연락처:051)509-6221 FAX:051)509-6260</p>
      
        </div>
      </div>
      </footer>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>