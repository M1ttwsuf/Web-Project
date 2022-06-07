<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>Snippet - BBBootstrap</title>
<link
	href='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css'
	rel='stylesheet'>
<link href='' rel='stylesheet'>
<script type='text/javascript'
	src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
<style>

<!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="css/style.css">

body {
	background-position: center;
	background-color: #eee;
	background-repeat: no-repeat;
	background-size: cover;
	color: #505050;
	font-family: "Rubik", Helvetica, Arial, sans-serif;
	font-size: 14px;
	font-weight: normal;
	line-height: 1.5;
	text-transform: none
}

.forgot {
	background-color: #fff;
	padding: 12px;
	border: 1px solid #dfdfdf
}

.padding-bottom-3x {
	padding-bottom: 72px !important
}

.card-footer {
	background-color: #fff
}

.btn {
	font-size: 13px
}

.form-control:focus {
	color: #495057;
	background-color: #fff;
	border-color: #76b7e9;
	outline: 0;
	box-shadow: 0 0 0 0px #28a745
}
</style>
</head>
<body oncontextmenu='return false' class='snippet-body'>
	<div class="container padding-bottom-3x mb-2 mt-5">
		<div class="row justify-content-center">
			<div class="col-lg-8 col-md-10">
				<div class="forgot">
					<h2>✔ 비밀번호 찾기
					 <img src="images/bufs_logo.jpg" alt="My Image" width="400" height="100"></h2>
				</div>
				<form class="card mt-4" action="forgotPassword" method="POST">
					<div class="card-body">
						<div class="form-group">
							<label for="email-for-pass">학교 이메일 주소를 입력하세요</label> <input
								class="form-control" type="text" name="email"
								id="email-for-pass" required=""><small
								class="form-text text-muted">OTP가 발급되었습니다. 학교 이메일 주소에서 확인하세요</small>
						</div>
					</div>
					<div class="card-footer">
						<button class="btn btn-success" type="submit">비밀번호 재설정</button>
						<button class="btn btn-danger" type="submit">로그인 페이지로 돌아가기</button>
					</div>
				</form>
			</div>
		</div>
	</div>
<script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
	<script type="text/javascript">
	if (status == "invalidName") {
		swal("", "성명을 입력하세요", "error");
	}
	</script>	
</body>
</html>