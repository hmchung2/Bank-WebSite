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

  
  <!-- <link href="assets/img/logo.png" rel="logo"> -->
    
  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="<%=request.getContextPath()%>/assets/vendor/aos/aos.css" rel="stylesheet">
<%--   <link href="<%=request.getContextPath()%>/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"> --%>
  <link href="<%=request.getContextPath()%>/assets/vendor/bootstrap/css/bootstrap.css" rel="stylesheet">
  <link href="<%=request.getContextPath()%>/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="<%=request.getContextPath()%>/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="<%=request.getContextPath()%>/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="<%=request.getContextPath()%>/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="<%=request.getContextPath()%>/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="<%=request.getContextPath()%>/assets/css/style.css" rel="stylesheet">
  <link href="<%=request.getContextPath()%>/assets/css/signUp.css" rel="stylesheet">
  
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
  
  
  

<script src="<%=request.getContextPath()%>/assets/js/jquery-3.6.0.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/js/myFunc.js"></script>

<script>

	$(document).ready(function() {
		$('#myMsg').hover(function() {
			$(this).css("color" , "white")
		}, function() {
			$(this).css("color", "#3A1D1D")
		})
	
		
		$('#selectEmail').change(function() {
			$("#selectEmail option:selected").each(function() {
				if ($(this).val() == '1') { //직접입력일 경우 
					$("#str_email02").val(''); //값 초기화 
					$("#str_email02").attr("disabled", false); //활성화 
				} else { //직접입력이 아닐경우 
					$("#str_email02").val($(this).text()); //선택값 입력 
					$("#str_email02").attr("disabled", true); //비활성화 
				}
			});
		});
		
		  $("#myModal").click(function(){
			    $(".modal").fadeIn();
		  });
		  
		  $(".exiting").click(function(){
			  $(".modal").fadeOut();
		  })	
	})

	function firstValidate() {	
		let check = false;
		let msg = ""
		
		if(idChk == "false"){
			msg = "아이디 중복확인이 필요합니다."
			alert(idChk)
		}
		else if($("#pw1").val() == "" ){
			msg = "비밀번호를 입력 바랍니다."			
		}
		else if($('#pw1').val().length < 5 ){
			msg = "비밀번호는 최소 다섯 글자 이상 필요 합니다."			
		}
		else if ($("#pw1").val() != $("#pw2").val()) {
			msg = "비빌번호를 정확히 재입력 바랍니다."		
		} else if($("#id_id").legnth < 5 ){
			msg = "아이디는 최소 다섯 글자 이상 필요합니다."
			
		} else{
			check = true
		}
		$("#sendingMyMsg").text(msg)
		$("#myModal").trigger("click");
			
		return check
	}

	function requestMsg(){
		
		var param = document.getElementById("id_id")
		var hiddenDiv = document.getElementById("MyhiddenMsg")
		param = param.value

		if (param.length < 5){
			alert("아이디는 5글자 이상 필요합니다.")
			hiddenDiv.innerText = "아이디는 5글자 이상 필요합니다."
			hiddenDiv.hidden = false
	
			
		} else{
			/// 1 단계 : XMLHttpReuquest 객체 생성
			if(window.XMLHttpRequest)
				httpRequest = new XMLHttpRequest()
			else if(window.ActiveXObject)
				httpRequest = new ActiveXObject("Microsoft.XMLHTTP")
			else
				httpReuqest = null;
			// 2단계 : callback 함수 호출
			httpRequest.onreadystatechange = responseMsg	
			// 3단계 : 서버에 비동기 요청
		
			httpRequest.open('GET' , '/Bank-Web/ajax/checkId?chkId=' + param , true)
			httpRequest.send(null)			
		}		
	}	
	let httpRequest =null
	let idChk = "false"
	
	
	function responseMsg(){		
		if(httpRequest.readyState == 4){
			if(httpRequest.status == 200){
				//var msg_id = document.getElementById("msgView");
				//msg_id.innerHTML += httpRequest.responseText;	
				let jsonResult = JSON.parse(httpRequest.responseText)
				sameID = jsonResult.result
				var hiddenDiv = document.getElementById("MyhiddenMsg")
				if( sameID == 0) {					
					idChk = "true"
					hiddenDiv.innerText = jsonResult.chkId +  " 는 사용 가능한 아이디 입니다."					
				}else{
					idChk = "false"
					hiddenDiv.innerText = jsonResult.chkId +  " 는 이미 사용중인 아이디 입니다."
				}	
				hiddenDiv.hidden = false
			}			
		}
	}
	
	function idChanged(){
		var hiddenDiv = document.getElementById("MyhiddenMsg")
		hiddenDiv.innerText = "아이디는 5글자 이상 필요합니다."
		hiddenDiv.hidden = true
		idChk = "false"
	}

</script>



</head>

<body>
<!-- Modal -->




  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top d-flex align-items-center">
   	<jsp:include page="/include/header.jsp" />
  </header><!-- End Header -->
  
    <main id="main">

    <!-- ======= Breadcrumbs Section ======= -->
    <section class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>회원가입</h2>
          <ol>
            <li><a href="<%=request.getContextPath() %>">홈</a></li>
            <li><a href="<%=request.getContextPath() %>/member/signcontract.do">이용약관</a></li>
            <li>회원가입</li>
          </ol>
        </div>
      </div>
    </section><!-- End Breadcrumbs Section -->
    
    
    <section class="inner-page">
<!-- Button trigger modal -->
<!-- Button trigger modal -->


    
<article class="card-body mx-auto" style="width: 39%;">
	<h4 class="card-title mt-3 text-center">Create Account</h4>
	<p class="text-center">Get started with your free account</p>
	<p>
		<a href="" class="btn btn-block btn-twitter" id="myMsg"> <img id="kakaoLog" src="<%=request.getContextPath()%>/assets/img/kakaoLogo.jpg">카카오로 로그인</a>	
	</p>

	
	<p class="divider-text">
        <span class="bg-light">OR</span>
    </p>

	<form action="<%=request.getContextPath() %>/member/signupProcess.do" method="post" onsubmit="return firstValidate()">	
		
	<input type="hidden" name="opt1" value="${param.chk3 }">
	<input type="hidden" name="opt1" value="${param.chk3 }">
	
	<div class="form-group input-group">
		<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-id-badge"></i> </span>
		 </div>
        <input name="id_id" class="form-control" placeholder="아이디" type="text" id="id_id"  onchange="idChanged()">
        <input type="button" class="btn btn-primary" value="중복 확인" onclick="requestMsg()" style="width:37%;">
    </div> <!-- form-group// -->
    
    <div id="MyhiddenMsg" hidden="true" style="color:red;">
    
    </div>
    
    <div class="form-group input-group">
		<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-user"></i> </span>
		 </div>
        <input name="last-name" class="form-control" placeholder="성" type="text">
    </div> <!-- form-group// -->
    
    
    <div class="form-group input-group">
		<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-user"></i> </span>
		 </div>
        <input name="first-name" class="form-control" placeholder="이름" type="text">
    </div> <!-- form-group// -->
    
    
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-envelope"></i> </span>
		 </div>
        <input type="text" name=str_email01 class="form-control" id="inlineFormInput" placeholder="이메일">
        <div class="input-group-text">@</div>
       <input type="text" name="str_email02" id="str_email02"
							style="width: 30%;" disabled value="naver.com"> <select
							style="width: 20%; margin-right: 0px" name="selectEmail"
							id="selectEmail">
							<option value="1">직접입력</option>
							<option value="naver.com" selected>naver.com</option>
							<option value="hanmail.net">hanmail.net</option>
							<option value="hotmail.com">hotmail.com</option>
							<option value="nate.com">nate.com</option>
							<option value="yahoo.co.kr">yahoo.co.kr</option>
							<option value="empas.com">empas.com</option>
							<option value="dreamwiz.com">dreamwiz.com</option>
							<option value="freechal.com">freechal.com</option>
							<option value="lycos.co.kr">lycos.co.kr</option>
							<option value="korea.com">korea.com</option>
							<option value="gmail.com">gmail.com</option>
							<option value="hanmir.com">hanmir.com</option>
							<option value="paran.com">paran.com</option>
						</select>         
    </div> <!-- form-group// -->
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-phone"></i> </span>
		</div>
		<select name="threeDigits" class="custom-select" style="max-width: 120px;">
		    <option selected > 010-</option>
		    <option value="1">012-</option>
		    <option value="2">031-</option>
		    <option value="3">017-</option>
		</select>
    	<input name="phone" class="form-control" pattern="\d{3,4}-\d{4}" placeholder="핸드폰 번호 : xxxx-xxxx 형식으로 입력하세요" type="tel">
    </div> <!-- form-group// -->


    
    <div class="form-group input-group">
		<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-id-card"></i> </span>
		 </div>
        <input name="ssn" class="form-control" pattern="\d{6}-\d{7}" placeholder="주민등록번호 : xxxxxx-xxxxxxx 형식으로 입력하세요" type="text">
    </div> <!-- form-group// -->
    
    

    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
		</div>
        <input name="pw1" class="form-control" placeholder="비밀번호 입력" type="password" id="pw1">
    </div> <!-- form-group// -->
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
		</div>
        <input name="pw2" class="form-control" placeholder="비밀번호 다시 입력" type="password" id="pw2">
    </div> <!-- form-group// -->                                      
    <div class="form-group">
        <button type="submit" class="btn btn-primary btn-block"> Create Account  </button>
    </div> <!-- form-group// -->      
    <p class="text-center">이미 회원 이십니까? <a href="">로그인</a> </p> 
</form>
</article>
    </section>

<button id="myModal" hidden="true">모달창</button>
<div class="modal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">에러 사항</h5>
        <button type="button" class="close exiting" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      
      
      <div class="modal-body">
      	<img src="<%=request.getContextPath()%>/assets/img/error.png" style="width:250px; height:200px;">
        <p id="sendingMyMsg" style="font-size:30px"></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary exiting">닫기</button>
      </div>
    </div>
  </div>
</div>


  </main><!-- End #main -->




  <footer id="footer">
  	<jsp:include page="/include/footer.jsp" />
  </footer><!-- End Footer -->

   
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
  
</body>
</html>

