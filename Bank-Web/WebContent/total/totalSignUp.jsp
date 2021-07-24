<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>WAndC 통합계좌 가입</title>
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
			$(this).css("color", "white")
		}, function() {
			$(this).css("color", "#3A1D1D")
		})

		$("#myModal").click(function() {
			$(".modal").fadeIn();
		});

		$(".exiting").click(function() {
			$(".modal").fadeOut();
		})
	})

	function firstValidate() {
		let check = false;
		let msg = ""
		

		if (idChk == "false") {
			msg = "아이디 중복확인이 필요합니다."
		} else if($("#ssn").val() != '${userVO.ssn}'  ){
			msg = "사용자 주민번호랑 일치 하지 않습니다."			
		}else if($('#userPw').val() !='${userVO.pwd}' ){
			alert('${userVO.pwd}')
			alert($('#userPw').val() )
			msg = "사용 아이디의 비밀번호랑 일치 하지 않습니다."
		}
		  else if ($("#pw1").val() == "") {
			msg = "비밀번호를 입력 바랍니다."
		} else if ($('#pw1').val().length < 5) {
			msg = "비밀번호는 최소 다섯 글자 이상 필요 합니다."
		} else if ($("#pw1").val() != $("#pw2").val()) {
			msg = "비빌번호를 정확히 재입력 바랍니다."
		} else if ($("#id_id").legnth < 5) {
			msg = "아이디는 최소 다섯 글자 이상 필요합니다."
		} else {
			return true;
		}
		$("#sendingMyMsg").text(msg)
		$("#myModal").trigger("click");
		return check
	}

	function requestMsg() {

		var param = document.getElementById("id_id")
		var hiddenDiv = document.getElementById("MyhiddenMsg")
		param = param.value

		if (param.length < 5) {
			alert("아이디는 5글자 이상 필요합니다.")
			hiddenDiv.innerText = "아이디는 5글자 이상 필요합니다."

		} else {
			/// 1 단계 : XMLHttpReuquest 객체 생성
			if (window.XMLHttpRequest)
				httpRequest = new XMLHttpRequest()
			else if (window.ActiveXObject)
				httpRequest = new ActiveXObject("Microsoft.XMLHTTP")
			else
				httpReuqest = null;
			// 2단계 : callback 함수 호출
			httpRequest.onreadystatechange = responseMsg
			// 3단계 : 서버에 비동기 요청
			httpRequest.open('GET', '/Bank-Web/ajax/checkTotalId?chkId=' + param,
					true)
			httpRequest.send(null)
		}
	}
	let httpRequest = null
	let idChk = "false"

	function responseMsg() {
		if (httpRequest.readyState == 4) {
			if (httpRequest.status == 200) {
				//var msg_id = document.getElementById("msgView");
				//msg_id.innerHTML += httpRequest.responseText;	
				let jsonResult = JSON.parse(httpRequest.responseText)
				sameID = jsonResult.result
				var hiddenDiv = document.getElementById("MyhiddenMsg")
				if (sameID == 0) {
					idChk = "true"
					hiddenDiv.innerText = jsonResult.chkId
							+ " 는 사용 가능한 아이디 입니다."
					$("#MyhiddenMsg").css("color" , "green")
				} else {
					idChk = "false"
					hiddenDiv.innerText = jsonResult.chkId
							+ " 는 이미 사용중인 아이디 입니다."
				}
				hiddenDiv.hidden = false
			}
		}
	}

	function idChanged() {
		var hiddenDiv = document.getElementById("MyhiddenMsg")
		$('#MyhiddenMsg').css("color" , "red")
		hiddenDiv.innerText = "중복확인이 필요 합니다."
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
	<h4 class="card-title mt-3 text-center">통합 계좌 생성</h4>
	<p class="text-center">타 은행 관리를 동시에 해보세요</p>	
	<p class="divider-text">
        <span class="bg-light">정보 입력</span>
    </p>

	<form action="<%=request.getContextPath() %>/total/totalSignupProcess.do" method="post" onsubmit="return firstValidate()">	
		
	<input type="hidden" name="opt1" value="${param.chk3 }">
	<input type="hidden" name="opt2" value="${param.chk3 }">
	
	<div class="form-group input-group">
		<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-id-badge"></i> </span>
		 </div>
        <input name="id_id" class="form-control" placeholder="아이디" type="text" id="id_id"  onchange="idChanged()">
        <input type="button" class="btn btn-primary" value="중복 확인" onclick="requestMsg()" style="width:37%;">
    </div> <!-- form-group// -->
    
    <div id="MyhiddenMsg" style="color:red;">
    	중복확인이 필요 합니다.
    </div>

	<div class="form-group input-group">
		<div class="input-group-prepend">
			<span class="input-group-text"> <i class="fa fa-user"></i>
			</span>
		</div>
		<input name="totalNick" class="form-control" placeholder="통합 계좌 별칭" type="text">
	</div>
	<!-- form-group// -->
	<div class="form-group input-group">
		<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-id-card"></i> </span>
		 </div>
        <input type="password" id="ssn" name="ssn" class="form-control" pattern="\d{6}-\d{7}" placeholder="주민등록번호 인증 : xxxxxx-xxxxxxx 형식으로 입력하세요" type="text">
    </div> <!-- form-group// -->

    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
		</div>
        <input id="userPw" name="userPw" class="form-control" placeholder="사용자 비밀번호 인증" type="password">
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
    <p class="text-center">이미 계좌가 있으신가요? <a href="">로그인</a> </p> 
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

