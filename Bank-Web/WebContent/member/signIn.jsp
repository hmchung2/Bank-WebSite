<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>WAndC 은행 로그인</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="<%=request.getContextPath()%>/assets/img/favicon.ico" rel="shortcut icon">  
  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="<%=request.getContextPath()%>/assets/vendor/aos/aos.css" rel="stylesheet">
  <%-- <link href="<%=request.getContextPath()%>/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"> --%>
  <link href="<%=request.getContextPath()%>/assets/vendor/bootstrap/css/bootstrap.css" rel="stylesheet">
  <link href="<%=request.getContextPath()%>/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="<%=request.getContextPath()%>/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="<%=request.getContextPath()%>/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="<%=request.getContextPath()%>/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="<%=request.getContextPath()%>/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="<%=request.getContextPath()%>/assets/css/style.css" rel="stylesheet"> 

  
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
  
  <script src="<%=request.getContextPath()%>/assets/js/jquery-3.6.0.min.js"></script>
  <script src="<%=request.getContextPath()%>/assets/js/myFunc.js"></script>
  
  <script src="https://developers.kakao.com/sdk/js/kakao.js"></script> 
 <script src="<%=request.getContextPath()%>/member/kakaoLogin.js"></script>
	
	
<script>
	// 임시 히든 post 태그 생성
	function hiddenPostURL(successURL, jsonParam){
		var form = '<form hidden="true" action="' + successURL + '" method="post">'
		if (jsonParam != null){
			for(let param in jsonParam){
				form += '<input type="text" name="' + param  + '" value="' + jsonParam[param] + '" />'
			}		
		}			
		form += '</form>'
		var formtag = $(form)
		$('body').append(formtag );
		formtag .submit();		
	}
	
	//카카오로그인
	function kakaoLogin(successURL ,failFunc1 ,failFunc2 , destination) {
	    Kakao.Auth.login({
	      success: function (response) {
	        Kakao.API.request({
	          url: '/v2/user/me',
	          success: function (response) {
	        	  console.log(response)
	        	  result = "success"
	        	  output = response
				 if(successURL != null){
					jsonResult= {"kakao_id":output.id , "email":output.kakao_account.email ,"destination": destination }
					hiddenPostURL(successURL , jsonResult )
				 } 		
	          },
	          fail: function (error) {
	            console.log(error)
				if(failFunc1 != null){
					failFunc1()	
				}			
	          },
	        })
	      },
	      fail: function (error) {
	        console.log(error)
			if(failFunc2 != null ){
				failFunc2();	
			}
	      },
	    })    
	 } 
	function kakaoLoginFailFunc(msg){
		$("#sendingMyMsg").text(msg)
		$("#myModal").trigger("click");
	}
	
	function kakaoLogin_process(successURL , destination){		
		//카카오 로근이 싫패시 에러
		kakao_init()
		error1 = function(){
			kakaoLoginFailFunc("문제 발생")
		}
		error2 = function(){
			kakaoLoginFailFunc("문제 발생")
		}		
		kakaoLogin(successURL ,error1 ,error2 , destination)
	}
	function loginCheck() {	
		let check = false;
		let msg = ""
		
		if($("#login_id").val() == "" ){
			msg = "아이디를 작성 바랍니다."
		}
		else if($('#login_pw').val() == "" ){
			msg = "비밀번호는 작성 바랍니다."			
		} else{
			return true
		}
		$("#sendingMyMsg").text(msg)
		$("#myModal").trigger("click");		
		return check
	}
		
	
	//지속적으로 크롬 브라우저에서 autofill 발생 -> 임시방편 자바스크립트 작성
	// 자연스럽게 보이기 위해 천천히 animation 발생 하는 방식으로 구현
	
	$(document).ready(function() {
		  $("#myModal").click(function(){
			  $(".modal").fadeIn();
		  });		  
		  $(".exiting").click(function(){
			  $(".modal").fadeOut();
		  })			
		if('${previous_msg}' !=  ""){
			$("#sendingMyMsg").html('${previous_msg}')
			$("#myModal").trigger("click");
		}
		if('{email_valid}' == "false"){
			kakaoLogout() 
		}
		  

		$('#myMsg').hover(function() {
			$(this).css("color" , "white")
		}, function() {
			$(this).css("color", "#3A1D1D")
		})
		appending1()
		setTimeout(function(){
			showing1()
		},1000); 		
		appending2()
		setTimeout(function(){
			showing2()
		},1000);
		
		
		setTimeout(function(){
			let id = document.getElementById("login_id")
			id.value = ""
			let pw = document.getElementById("login_pw")
			pw.value = ""
			}, 1000);  
		
		});
		
/* 		if('${destination}' != ""){			
			$('#myMsg').attr("onclick" , "kakaoLogin_process('Bank-Web/member/signinProcess.do?' , ${destination}  )")
		} */
	
<%-- 	<form id="my-login-form" action="<%=request.getContextPath() %>/member/signinProcess.do" method="post" style="width:50%; margin: 0px auto" onsubmit="return loginCheck()">
 --%>
	
<%-- 	<a id="myMsg" onclick="kakaoLogin_process('<%=request.getContextPath()%>/member/kakaosigninProcess.do')" class="btn btn-block btn-twitter" style="float:right;"> <img id="kakaoLog" src="<%=request.getContextPath()%>/assets/img/kakaoLogo.jpg">카카오로 로그인</a>																				
 --%>
	function appending1(){
	    $('#login_id').hide()
	    
	}
	
	function showing1(){	    
	    $('#login_id').val("");	    
	    $('#login_id').show('slow');
	    
	}
	
	

	function appending2(){
		$('#login_pw').hide()
	    
	}
	function showing2(){	    
	    $('#login_pw').val("");	    
	    $('#login_pw').show('slow');
	    
	}
	

	
</script>

<style>
.divider-text {
    position: relative;
    text-align: center;
    margin-top: 15px;
    margin-bottom: 15px;
}
.divider-text span {
    padding: 7px;
    font-size: 12px;
    position: relative;   
    z-index: 2;
}
.divider-text:after {
    content: "";
    position: absolute;
    width: 100%;
    border-bottom: 1px solid #ddd;
    top: 55%;
    left: 0;
    z-index: 1;
}


.btn-twitter {
    background-color: #F7E600;
    color:#3A1D1D;
}



#kakaoLog{	
	width: 20px;
	height : 20px;
}

form div.form-group{
	margin: 15px;
}

</style>


</head>

<body>
  <!-- ======= Header ======= -->
	<header id="header" class="fixed-top d-flex align-items-center">
		<jsp:include page="/include/header.jsp" />
	</header>
	<!-- End Header -->

	<main id="main">

		<!-- ======= Breadcrumbs Section ======= -->
		<section class="breadcrumbs">
			<div class="container">

				<div class="d-flex justify-content-between align-items-center">
				<h2>Wells & Clarify</h2>
					<ol>
						<li><a href="<%=request.getContextPath() %>">홈</a></li>
						<li>로그인</li>
					</ol>
				</div>
			</div>
		</section>
		<!-- End Breadcrumbs Section -->

		<section class="inner-page">
			<div class="container">
				<div class="d-flex justify-content-between align-items-center">
 					<img src="<%=request.getContextPath()%>/assets/img/tp_logo.png"
						alt="" width="172" height="157" style="margin: auto;">
				</div>
				<div class="d-flex justify-content-between align-items-center">

					<h2 style="margin: auto; margin-top: 30px; margin-bottom: 20px;">please
						Sign In</h2>
				</div>

				<main class="form-signin">
					<form id="my-login-form" action="<%=request.getContextPath() %>/member/signinProcess.do" method="post" style="width:50%; margin: 0px auto" onsubmit="return loginCheck()">
					
					<input type="text" hidden="true" id="destination" name="destinationParam" value="${destination }">
					
					<div class="form-group input-group" id="field1">
							<div class="input-group-prepend">
								<span class="input-group-text"> <i class="fa fa-user fa-sm"></i>
								</span>
							</div>
							<input autocomplete="anyrandomstring" name="login_id" class="form-control" placeholder="아이디"
								type="text" id="login_id"> 
						</div>
						<!-- form-group// -->


						<div class="form-group input-group" id="field2">
							<div class="input-group-prepend" id="field2">
								<span class="input-group-text"> <i class="fa fa-lock fa-sm"></i>
								</span>
							</div>
						<input autocomplete="anyrandomstring" name="login_pw" class="form-control" placeholder="비밀번호"
								type="password" id="login_pw"> 
						</div>
						<!-- form-group// -->
						
						<input hidden="true" id="kakao_id">
						<input hidden="true" id="kakao_email">
						
	
						<div class="form-group" style="width:100%;">																					
							<button type="submit" class="btn btn-primary btn-block" id="loginbtn" style="width:50%;">
								로그인</button>
																
						<a id="myMsg" onclick="kakaoLogin_process('<%=request.getContextPath()%>/member/kakaosigninProcess.do' , '${destination}')" class="btn btn-block btn-twitter" style="float:right;"> <img id="kakaoLog" src="<%=request.getContextPath()%>/assets/img/kakaoLogo.jpg">카카오로 로그인</a>																				
						</div>                 
						<!-- form-group// -->
						<p class="text-center">아직 회원가입을 안하셨나요? <a href="">회원가입 하기</a> </p> 
					</form>
				</main>
			</div>
		</section>


		<button id="myModal" hidden="true">모달창</button>
		<div class="modal" tabindex="-1" role="dialog">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">Wells & Clarify</h5>
						<button type="button" class="close exiting" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>


					<div class="modal-body">
						<img src="<%=request.getContextPath()%>/assets/img/illustration-6.svg"
							style="width: 250px; height: 200px;">
						<p id="sendingMyMsg" style="font-size: 30px"></p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary exiting">닫기</button>
					</div>
				</div>
			</div>
		</div>

	</main>

  <footer id="footer">
  	<jsp:include page="/include/footer.jsp" />
  </footer>

   
  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="<%=request.getContextPath()%>/assets/vendor/aos/aos.js"></script>
  <script src="<%=request.getContextPath()%>/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="<%=request.getContextPath()%>/assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="<%=request.getContextPath()%>/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="<%=request.getContextPath()%>/assets/vendor/php-email-form/validate.js"></script>
  <script src="<%=request.getContextPath()%>/assets/vendor/purecounter/purecounter.js"></script>
  <script src="<%=request.getContextPath()%>/assets/vendor/swiper/swiper-bundle.min.js"></script> 	
  <!-- Template Main JS File -->
  <script src="<%=request.getContextPath()%>/assets/js/main.js"></script>
  	<script src="<%=request.getContextPath()%>/assets/js/myFunc.js"></script>
  
</body>
</html>
