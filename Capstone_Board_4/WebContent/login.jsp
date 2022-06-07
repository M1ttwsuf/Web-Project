<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>BUFS login</title>

<!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="css/style.css">
</head>
<body>

	<input type="hidden" id="status"
		value="<%=request.getAttribute("status")%>">

	<div class="main">

		<!-- Sing in  Form -->
		<section class="sign-in">
			<div class="container">
				<div class="signin-content">
					<div class="signin-image">
						<figure>
							<a href="index.jsp"><img src="images/signin-img.jpg"
								alt="singup-image"></a>

						</figure>
						<a href="registration.jsp" class="signup-image-link"> 소속 인증하기</a>
					</div>

					<div class="signin-form">
						<h2 class="form-title">로그인</h2>
						<form method="post" action="login" class="register-form"
							id="login-form">
							<div class="form-group">
								<label for="username"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="username" id="username" placeholder="학번"
									required="required" />
							</div>
							<div class="form-group">
								<label for="password"><i class="zmdi zmdi-lock"></i></label> <input
									type="password" name="password" id="password"
									placeholder="비밀번호" required="required" />
							</div>
							<div class="form-group">
								<a href="forgotPassword.jsp">비밀번호 찾기</a>
							</div>
							<div class="form-group form-button">
								<input type="submit" name="signin" id="signin"
									class="form-submit" value="로그인" />
							</div>
						</form>
					</div>
				</div>
			</div>
		</section>

	</div>

	<!-- JS -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">

	<script type="text/javascript">
		var status = document.getElementById("status").value;
		if (status == "failed") {
			swal("", "비밀번호가 일치하지 않습니다", "error",{
				button : "확인",			
			});
		}
		 else if (status == "invalidEmail") {
			swal("", "학번을 입력해주세요", "error");
		} else if (status == "invalidUpwd") {
			swal("", "비밀번호를 입력해주세요", "error");
		} else if (status == "resetSuccess") {
			swal("", "비밀번호가 변경되었습니다", "sucess");
		} else if (status == "resetFailed") {
			swal("", "비밀번호 변경에 실패했습니다", "error");
		}
	</script>
</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>