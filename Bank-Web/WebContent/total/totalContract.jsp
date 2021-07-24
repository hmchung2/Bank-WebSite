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
  <link href="<%=request.getContextPath()%>/assets/img/favicon.ico" rel="icon">  

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
  <link href="<%=request.getContextPath()%>/assets/css/signUpContract.css" rel="stylesheet">
  <!-- =======================================================
  * Template Name: Vesperr - v4.3.0
  * Template URL: https://bootstrapmade.com/vesperr-free-bootstrap-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
<script src="<%=request.getContextPath()%>/assets/js/jquery-3.6.0.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/js/myFunc.js"></script>

<script>
	function selectAll() {
		let tags = document.querySelectorAll(".checkBtn input")
		let length = tags.length
		for (let i = 0; i < length; i++) {
			tags[i].checked = true
		}
	}

	function unselectAll() {
		let tags = document.querySelectorAll(".checkBtn input")
		let length = tags.length
		for (let i = 0; i < length; i++) {
			tags[i].checked = false
		}
	}
	function toggle() {
		if ($('.checkAllBtn #chk').is(":checked")) {
			selectAll()
		} else {
			let check = true
			let tags = document.querySelectorAll(".checkBtn input")
			let f = document.querySelectorAll(".checkBtn input")
			let cnt = 0
			for (let i = 0; i < tags.length && tags[i].checked; i++) {
				if (tags[i].checked)
					cnt++
				else
					break
			}
			if (cnt == tags.length) {
				unselectAll()
			}
		}
	}

	function checkRequired() {
		let requiredTags = document.querySelectorAll(".required input")
		let length = requiredTags.length
		let cnt = 0
		for (let i = 0; i < length; i++) {
			if (requiredTags[i].checked) {
				cnt++
			} else {
				break
			}
		}
		if (cnt == length) {
			return true
		} else {
			$(".required input").css("outline", "2px solid #0d6efd")
			return false
		}
		return false
	}
</script>

</head>

<body>
  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top d-flex align-items-center">
   	<jsp:include page="/include/header.jsp" />
  </header><!-- End Header -->
  
    <main id="main">

    <!-- ======= Breadcrumbs Section ======= -->
    <section class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>통합계좌</h2>
          <ol>
            <li><a href="<%=request.getContextPath() %>">홈</a></li>
            <li>이용약관</li>
          </ol>
        </div>
      </div>
    </section><!-- End Breadcrumbs Section -->

		<section class="inner-page">
			<div class="container">
				
				<div class="d-flex justify-content-between align-items-center">
					<img src="<%=request.getContextPath()%>/assets/img/tp_logo.png"
						alt="" width="172" height="157" style="margin: auto;">
				</div>
				<div class="d-flex justify-content-between align-items-center">

					<h2 style="margin: auto; margin-top: 30px; margin-bottom: 20px;">통합계좌 이용약관</h2>
				</div>

<form action="<%=request.getContextPath() %>/total/totalSignup.do" id="joinForm"  method="post" name="joinForm" onsubmit="return checkRequired()">
            <ul class="join_box">
                <li class="checkBox check01">
                    <ul class="clearfix">
                        <li>이용약관, 개인정보 수집 및 이용,
                            위치정보 이용약관(선택), 프로모션 안내
                            메일 수신(선택)에 모두 동의합니다.</li>
                        <li class="checkAllBtn">
                            <input type="checkbox" name="chkAll" id="chk" class="chkAll" onclick="toggle()">
                        </li>
                    </ul>
                </li>
                <li class="checkBox check02">
                    <ul class="clearfix">
                        <li>이용약관 동의(필수)</li>
                        <li class="checkBtn required">
                            <input type="checkbox" name="chk1"> 
                        </li>
                    </ul>
                    <textarea name="" id="">여러분을 환영합니다.
네이버 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 네이버 서비스의 이용과 관련하여 네이버 서비스를 제공하는 네이버 주식회사(이하 ‘네이버’)와 이를 이용하는 네이버 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 네이버 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
       </textarea>
                </li>
                <li class="checkBox check03">
                    <ul class="clearfix">
                        <li>개인정보 수집 및 이용에 대한 안내(필수)</li>
                        <li class="checkBtn required">
                            <input type="checkbox" name="chk2">
                        </li>
                    </ul>
 
                    <textarea name="" id="">여러분을 환영합니다.
네이버 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 네이버 서비스의 이용과 관련하여 네이버 서비스를 제공하는 네이버 주식회사(이하 ‘네이버’)와 이를 이용하는 네이버 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 네이버 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
       </textarea>
                </li>
                <li class="checkBox check03">
                    <ul class="clearfix">
                        <li>위치정보 이용약관 동의(선택)</li>
                        <li class="checkBtn">
                            <input type="checkbox" name="chk3">
                        </li>
                    </ul>
 
                    <textarea name="" id="">여러분을 환영합니다.
네이버 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 네이버 서비스의 이용과 관련하여 네이버 서비스를 제공하는 네이버 주식회사(이하 ‘네이버’)와 이를 이용하는 네이버 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 네이버 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
       </textarea>
                </li>
                <li class="checkBox check04">
                    <ul class="clearfix">
                        <li>이벤트 등 프로모션 알림 메일 수신(선택)</li>
                        <li class="checkBtn">
                            <input type="checkbox" name="chk4">
                        </li>
                    </ul> 
                </li>
            </ul>
            <ul class="footBtwrap clearfix">
                <li><button class="fpmgBt1">취소</button></li>
                <li><button class="fpmgBt2" id="confirm-btn">확인</button></li>
            </ul>
        </form>        
			</div>
		</section>
	</main><!-- End #main -->

  <footer id="footer">
  	<br>
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
  
</body>
</html>


