<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    
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
 
 <script>
	 $(document).ready(function(){
		 
		 
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

				<div class="d-flex justify-content-between align-items-center">
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

        <div class="section-title" data-aos="fade-up">
          <h2>Services</h2>
          <p>Magnam dolores commodi suscipit eius consequatur ex aliquid fug</p>
        </div>

        <div id="newTT" class="row">
          <div class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mb-lg-0">
            <div class="icon-box" data-aos="fade-up" data-aos-delay="100">
              <div class="icon"><i class="fas fa-user-plus"></i></div>
             	<h3><a href="#">새 통합계좌 만들기</a></h3>
            </div>
          </div>

          <div class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mb-lg-0">
            <div class="icon-box" data-aos="fade-up" data-aos-delay="200">
              <div class="icon"><i class="fas fa-user"></i></div>
              <h4 class="title"><a href="">Sed ut perspiciatis</a></h4>
              <p class="description">Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore</p>
            </div>
          </div>
        </div>
      </div>
    </section><!-- End Services Section -->




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