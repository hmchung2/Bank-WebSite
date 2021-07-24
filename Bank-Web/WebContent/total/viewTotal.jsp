<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>WAndC 통합계좌</title>
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
 
 <style>
 button{
	  background: #3498db;
	  border: 0;
	  padding: 10px 24px;
	  color: #fff;
	  transition: 0.4s;
	  border-radius: 50px;
 }
 .inputPwd{
  margin : 5px;
  border-color: #3498db;
  border-style: dotted solid;
 }
 
 </style>

<script>
	$(document).ready(function() {
		
		data = '${ list }'
	//	data2 = JSON.parse('${list}')
	
		
		$('.cancelView').hide()
		$('.confirm').hide()
		$('.inputPwd').hide()
		
		$('#newTT').click(function() {
			var href = $('#newTTatag').attr('href');
			location.href = href
		})
		
		if('${previous_msg}' !=  null &  '${previous_msg}' !=  ""){
			$("#sendingMyMsg").html('${previous_msg}')
		}

		$('.viewUser').click(function(){
			$(this).parent().children('.inputPwd').show()
			$(this).parent().children('.cancelView').show()
			$(this).parent().children('.confirm').show()
			$(this).hide()
		})
		
		$('.cancelView').click(function(){
			$(this).parent().children('.inputPwd').hide()
			$(this).hide()
			$(this).parent().children('.confirm').hide()			
			$(this).parent().children('.viewUser').show()
			
		})
		
		$(".functionForm").click(function( ){
			alert($(this).find(".totalNick") )
			
		})		

	})
	
			
	
</script>


</head>

<body>
	<!-- ======= Header ======= -->
	<header id="header" class="fixed-top d-flex align-items-center">
		<jsp:include page="/include/header.jsp" />
	</header>


	<main id="main">

		<!-- ======= Breadcrumbs Section ======= -->
		<section class="breadcrumbs">
			<div class="container">
								
				<div  class="d-flex justify-content-between align-items-center">
					<h2>Wells & Clarify</h2>
					<ol>
						<li><a href="<%=request.getContextPath() %>">홈</a></li>
						<li>통합계좌</li>
					</ol>
				</div>
			</div>
		</section>
		
    <!-- ======= Services Section ======= -->
		<section id="services" class="services">
			<div class="container">
				<h2 id="sendingMyMsg" style="color: red;"></h2>
				<div class="section-title" data-aos="fade-up">
					<h2>통합 계정</h2>
					<p>새 통합계정 만들기를 클릭해서 새로운 계정을 만드세요 </p>
				</div>

				<div class="row">

					<div id="newTT"
						class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mb-lg-0">
						<div class="icon-box" data-aos="fade-up" data-aos-delay="100">
							<div class="icon">
								<i class="fas fa-user-plus"></i>
							</div>
							<h3 class="title">
								<a id="newTTatag"
									href="<%=request.getContextPath()%>/total/newTotal.do">새
									통합계정 만들기</a>
							</h3>

						</div>
					</div>

<c:forEach items="${ list }" var="totalUser" varStatus="loop">
	<div
		class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mb-lg-0">
		<div class="icon-box" data-aos="fade-up" data-aos-delay="200">
			<form action="<%=request.getContextPath() %>/total/viewEachTotal.do">
				<div class="icon">
					<i class="fas fa-user"></i>
				</div>

				<h4 class="title">
					<a href="">별칭  ${totalUser.totalNick }</a>
				</h4>
				<div class="description">
					<ul>
						<li>아이디 : ${totalUser.totalId }</li>
						<li>개설일 : ${totalUser.regDate }</li>
						<li>약관 설정1 : ${totalUser.opt1 }</li>
						<li>약관 설정2 : ${totalUser.opt2 }</li>
					</ul>
					<div class="contact">
						<input type="hidden" name="totalNick" value="${totalUser.totalNick }"  >
						<input type="hidden" name="totalId" value="${totalUser.totalId }"  >
						<input type="hidden" name="regDate" value="${totalUser.regDate }"  >
						<input type="hidden" name="opt1" value="${totalUser.opt1 }"  >
						<input type="hidden" name="opt2" value="${totalUser.opt2 }"  >											
						<input name="totalPwd" type="password" class="inputPwd"
							placeholder="통합계정 비밀번호">
						<button type="button" class="viewUser">조회</button>
						<button type="button" class="cancelView" style="background-color: red">취소</button>
						<button type="submit" class="confirm" style="background-color: green">확인</button>
					</div>
				</div>
			</form>
		</div>


	</div>
</c:forEach>



				</div>

			</div>
		</section>
		<!-- End Services Section -->




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