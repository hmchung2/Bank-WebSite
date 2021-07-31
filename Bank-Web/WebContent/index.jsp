<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


    
<!DOCTYPE html>
<html lang="ko">

<%
	String msg = (String)session.getAttribute("msg");
	session.removeAttribute("msg");
	System.out.println(msg);
	pageContext.setAttribute("msg", msg);
	
%>

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>WAndC 은행 홈페이지</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="<%=request.getContextPath()%>/assets/img/favicon.ico" rel="icon">  
  
  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="<%=request.getContextPath()%>/assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="<%=request.getContextPath()%>/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="<%=request.getContextPath()%>/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="<%=request.getContextPath()%>/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="<%=request.getContextPath()%>/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="<%=request.getContextPath()%>/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="<%=request.getContextPath()%>/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="<%=request.getContextPath()%>/assets/css/style.css" rel="stylesheet">
  <link href="<%=request.getContextPath()%>/assets/css/myIndex.css" rel="stylesheet">
  <!-- =======================================================
  * Template Name: Vesperr - v4.3.0
  * Template URL: https://bootstrapmade.com/vesperr-free-bootstrap-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
<script src="<%=request.getContextPath()%>/assets/js/jquery-3.6.0.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/js/myFunc.js"></script>
<script>
$(document).ready(function() {
	 $("#myModal").click(function(){
		  $(".modal").fadeIn();
	  });		  
	  $(".exiting").click(function(){
		  $(".modal").fadeOut();
	  })			
	
	if('${msg}' !=  ""){
		console.log('${msg}')	
		$("#sendingMyMsg").html('${msg}')
		$("#myModal").trigger("click");	
	}
})

</script>

</head>
<body>

  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top d-flex align-items-center">
   	<jsp:include page="/include/header.jsp" />
  </header><!-- End Header -->
  


  <!-- ======= Hero Section ======= -->
  <section id="hero" class="d-flex align-items-center">

    <div class="container">
			<div class="row">
				<div
					class="col-lg-6 pt-5 pt-lg-0 order-2 order-lg-1 d-flex flex-column justify-content-center">
					<h1 data-aos="fade-up">통합계좌 시스템을 활용해서 간편한 펀드 관리</h1>
					<h2 data-aos="fade-up" data-aos-delay="400" style="margin-bottom:35px;">
						원자성, 일관성, 격리성, 영속성을 보유한 <br> Transaction 시스템
					</h2>
					<div data-aos="fade-up" data-aos-delay="800">
						<a href="<%=request.getContextPath() %>/bank/createAccount.do" class="btn-get-started scrollto">시작하기</a>
					</div>

					<div class="btn-group" style="top:10px;">
						<a href="<%=request.getContextPath() %>/total/viewTotal.do" class="btn btn-primary active" aria-current="page">통합계좌 <br>
						<span id="option-symbol">
						☁
						</span>	
						</a>
						<a href="<%=request.getContextPath() %>/bank/viewAccount.do" class="btn btn-primary">조회 <br> 
							<span id="option-symbol">₩ </span></a> 
						<a href="<%=request.getContextPath() %>/bank/viewAccount.do" class="btn btn-primary">이체 <br> 
						<span id="option-symbol">➧ </span></a>
					</div>
				</div>
				
				<div class="col-lg-6 order-1 order-lg-2 hero-img"
					data-aos="fade-left" data-aos-delay="200">
					<img src="assets/img/hero-img.png" class="img-fluid animated"
						alt="">
				</div>
			</div>
		</div>

  </section><!-- End Hero -->

  <main id="main">

     <!-- ======= Clients Section ======= -->
    <section id="clients" class="clients clients">
      <div class="container">

        <div class="row">

          <div class="col-lg-2 col-md-4 col-6">
            <img src="assets/img/clients/client-1.png" class="img-fluid" alt="" data-aos="zoom-in">
          </div>

          <div class="col-lg-2 col-md-4 col-6">
            <img src="assets/img/clients/client-2.png" class="img-fluid" alt="" data-aos="zoom-in" data-aos-delay="100">
          </div>

          <div class="col-lg-2 col-md-4 col-6">
            <img src="assets/img/clients/client-3.png" class="img-fluid" alt="" data-aos="zoom-in" data-aos-delay="200">
          </div>

          <div class="col-lg-2 col-md-4 col-6">
            <img src="assets/img/clients/client-4.png" class="img-fluid" alt="" data-aos="zoom-in" data-aos-delay="300">
          </div>

          <div class="col-lg-2 col-md-4 col-6">
            <img src="assets/img/clients/client-5.png" class="img-fluid" alt="" data-aos="zoom-in" data-aos-delay="400">
          </div>

          <div class="col-lg-2 col-md-4 col-6">
            <img src="assets/img/clients/client-6.png" class="img-fluid" alt="" data-aos="zoom-in" data-aos-delay="500">
          </div>

        </div>

      </div>
    </section><!-- End Clients Section -->


    <!-- ======= About Us Section ======= -->
    <section id="about" class="about">
      <div class="container">

        <div class="section-title" data-aos="fade-up">
          <h2>About Us</h2>
        </div>

        <div class="row content">
          <div class="col-lg-6" data-aos="fade-up" data-aos-delay="150">
            <p>
              WC 은행은 미래 기술을 누구나 손쉽게 사용할 수 있도록 기술플랫폼으로서의 변화를 추구하며,
수많은 개인과 다양한 파트너들이 성공이라는 꽃을 피울 수 있도록 경쟁력을 키우며 다가올 미래를 준비하겠습니다
            </p>
            <ul>
              <li><i class="ri-check-double-line"></i> 기업의 지속가능한 성장과 발전의 근간은 투명하고 건전한 지배구조입니다</li>
              <li><i class="ri-check-double-line"></i> 올바른 경영의 방향을 확립하고, 고객, 주주, 임직원을 비롯한 다양한 파트너들과 가치를 공유하며 더욱 신뢰받는 기업으로 거듭나겠습니다.</li>
              <li><i class="ri-check-double-line"></i> 프로젝트 꽃은 SME와 크리에이터의 가치를 발견하고 지속 가능한 성공을 응원하는 WC의 핵심캠페인입니다.</li>
            </ul>
          </div>
          <div class="col-lg-6 pt-4 pt-lg-0" data-aos="fade-up" data-aos-delay="300">
            <p>
              WC 은행은 기술플랫폼으로서 첨단 기술을 누구나 쉽게 활용할 수 있는 일상의 친숙한 서비스로 제공하기 위해
				변화를 추구하고, 이용자와 호흡하며 항상 새로운 도전을 시도합니다.
				WC 은행은  사용자의 검색 의도와 맥락을 깊이 이해하는 검색 서비스를 중심으로 개인의 다양한 관심사를 이어갈 수 있는 콘텐츠 주제판을 제공하고 있습니다.
				또한 매일 다양한 사용자의 생각과 관심사를 연결하고, 새로운 기회를 만들어가는 플랫폼이 되고자 크고 작은 변화들을 이어가고 있습니다.
            </p>
            <a href="#" class="btn-learn-more">더 배우기</a>
          </div>
        </div>

      </div>
    </section><!-- End About Us Section -->
  </main><!-- End #main -->
  
  
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
  
  <!-- ======= Footer ======= -->
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
	<script src="<%=request.getContextPath()%>/assets/js/myFunc.js"></script>
</body>

</html>