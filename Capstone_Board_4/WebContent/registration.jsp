<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.web.project.SenddigitAction"%>
<%@ page import="com.web.project.ValidateOtp"%>
<!-- value == otp  -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Sign Up Form</title>

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

		<!-- Sign up form -->
		<section class="signup">
			<div class="container">
				<div class="signup-content">
					<div class="signup-form">
						<h2 class="form-title">재학생 인증</h2>

						<form method="get" action="register" class="register-form"
							id="register-form">
							<div class="form-group">
								<label for="name"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="name" id="name" placeholder="성명"
									required="required" />
							</div>
							<div class="form-group">
								<label for="email"><i class="zmdi zmdi-email"></i></label> <input
									type="email" name="email" id="email" placeholder="학교 이메일 주소"
									required="required" />
							</div>
							<div class="form-group">
								<label for="pass"><i class="zmdi zmdi-lock"></i></label> <input
									type="password" name="pass" id="pass" placeholder="비밀번호"
									required="required" />
							</div>
							<div class="form-group">
								<label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
								<input type="password" name="re_pass" id="re_pass"
									placeholder="비밀번호 확인" required="required" />
							</div>
							<div class="form-group">
								<label for="stnum"><i class="zmdi zmdi-lock-outline"></i></label>
								<input type="text" name="stnum" id="stnum" placeholder="학번"
									required="required" />
							</div>

							<div class="form-group form-button">
								<input type="submit" name="signup" id="signup"
									class="form-submit" value="인증하기" />
							</div>

						</form>
					</div>
					<div class="signup-image">
						<figure>
							<a href="index.jsp"><img src="images/signup-img.jpg"
								alt="singup-image"></a>

						</figure>
						<a href="login.jsp" class="signup-image-link">로그인 하기</a>
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
		var digit = ${STR};
		
	 		if (status == "success") {
		 swal("", " 메일로 인증번호가 전송되었습니다.인증을 완료해주세요", "info",{
			  content: {
				    element: "input",
				    attributes: {
				      placeholder: "인증번호를 입력해주세요",
				      type: "input",
				   				 },
				 		},
						button : "인증하기",			
				}).then((result)=>{
						if(result == digit){
				swal("","인증되었습니다","success",{
					button : "확인",
						
							}).then((result)=>{
								if(result){
								location.href ='login.jsp';
											}
									});		
					}else{
						swal("","인증번호가 일치하지 않습니다.","error",{
							  content: {
								    element: "input",
								    attributes: {
								      placeholder: "인증번호를 입력해주세요",
								      type: "input",
								   				 },
								 		},
										button : "인증하기",			
								}).then((result)=>{
									if(result==digit){
										swal("","인증되었습니다","success",{
											button : "확인",
									
										}).then((result)=>{
											if(result){
										location.href ='login.jsp';
													}
											});							
								}else{
									swal("","인증에 실패했습니다","error",{
										button : "확인",
									})
									
								}									
							});
						}
					});
				}		
	 			
		if (status == "invalidName") {
			swal("", "성명을 입력하세요", "error");
		}
		if (status == "invalidEmail") {
			swal("", "이메일을 입력하세요", "error");
		}
		if (status == "containsEmail") {
			swal("", "@office.bufs.ac.kr을 포함하고 있지 않습니다", "error");
		}
		if (status == "invalidUpwd") {
			swal("", "비밀번호를 입력하세요", "error");
		}
		if (status == "invalidComfirmPassword") {
			swal("", "비밀번호가 일치하지 않습니다", "error");
		}
		if (status == "invalidStnum") {
			swal("", "학번을 올바르게 입력해주세요", "error");
		}
		if (status == "invalidStnumLength") {
			swal("", "학번은 8자리 숫자입니다 ", "error");
		}
		if (status == "containsinvalidStnum") {
			swal("", "학번은 문자를 포함하고 있지 않습니다", "error");
		}
	</script>

</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>

<%-- if (status == "success") {
		 swal("", "인증번호가 전송되었습니다. 인증을 완료해주세요", "info",{
			button : "인증하기",					
		}).then((result)=>{
			if(result){
				swal("","인증되었습니다","success",{
					button : "확인",
						
		}).then((result)=>{
			if(result){
				location.href ='login.jsp';
						}
					});		
				}
		}); */
		
			/* swal("", "인증번호가 전송되었습니다. 인증을 완료해주세요", "info",{
			  title: 'Login Form',
			  /* html: `<input type="text" id="username" class="swal2-input" placeholder="username">
			  <input type="password" id="password" class="swal2-input" placeholder="password">`, 
			  confirmButtonText: 'Sign in',
			  focusConfirm: false,
			  preConfirm: () => {
			    const login = Swal.getPopup().querySelector('#username').value
			    const password = Swal.getPopup().querySelector('#password').value
			    if (!login || !password) {
			      Swal.showValidationMessage(`Please enter login and password`)
			    }
			    return { login: login, password: password }
			  }
			}).then((result) => {
			  Swal.fire(`
			    Login: ${result.value.login}
			    Password: ${result.value.password}
			  `.trim())
			}); 

} --%>