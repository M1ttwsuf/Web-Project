<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"  %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link href="style1.css" rel="stylesheet" type="text/css"/>
<title>게시판 작성</title>
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
					<form method="post" action="writeAction.jsp">
						<table class="table table-striped"
							style="text-aling: center; border: 1px solid #dddddd">
							<thead>
								<tr>
									<th colspan="2"
										style="background-color: #eeeeee; text-align: center;">게시판
										글쓰기 양식</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><input type="text" class="form-control"
										placeholder="글 제목" name="bbsTitle" maxlength="50"></td>
								</tr>
								<tr> <!-- 글 쓰기 사이즈 바꿀거면 여기서 -->
									<td><textarea class="form-control" placeholder="글 내용"
											name="bbsContent" maxlength="2048" style="height: 350px;"></textarea></td>
								</tr>
							</tbody>
						</table>
						<input type="submit" class="btn btn-primary pull-right"
							value="글쓰기">
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- 본문 끝 -->
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>