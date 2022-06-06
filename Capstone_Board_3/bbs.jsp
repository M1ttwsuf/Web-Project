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
<%@ include file="/Layout/Header.jsp" %>
		
	<div class="container-fluid">

  	<!-- 사이드바 -->
    <nav class="col-sm-3 sidenav" style="margin-left:2%">
    <h4></h4>
      <ul class="nav nav-pills nav-stacked" >
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
					int pageNumber = 1;
						BbsDAO bbsDAO = new BbsDAO();
									ArrayList<BbsDTO> list = bbsDAO.getList(pageNumber);
									for(int i = 0; i< list.size(); i++){
					%>
					<tr>
						<td><%= list.get(i).getBbsID() %></td>
						<td><a href="view.jsp?bbsID=<%= list.get(i).getBbsID() %>"><%= list.get(i).getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></a></td>
						<td><%= list.get(i).getUstudentnumber() %> </td>
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